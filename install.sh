#!/usr/bin/env bash

set -euo pipefail

if [[ "$(tty)" == /dev/tty* ]]; then
  setfont latarcyrheb-sun32
else
  printf "[!] Not in TTY, skipping font size...\n"
fi

printf "[+] Starting Arch setup...\n"

printf "[+] Installing base packages...\n"
sudo pacman -Syu --needed --noconfirm base-devel stow fish eza git

printf "[!] Verifying whether yay is installed or not...\n"
if ! command -v yay &>/dev/null; then
  printf "[!] yay not found\n"
  printf "[+] Installing yay...\n"
  tmpdir=$(mktemp -d)
  trap 'rm -rf "$tmpdir"' EXIT
  git clone https://aur.archlinux.org/yay-bin.git "$tmpdir/yay-bin"
  (cd "$tmpdir/yay-bin" && makepkg -si --noconfirm)
else
  printf "[✓] yay already installed\n"
fi

printf "[+] Creating config directories...\n"
mkdir -p ~/.local/share/fonts

if [ -d "$HOME/.config" ]; then
    mv "$HOME/.config" "$HOME/.config.bak"
fi

mkdir -p "$HOME/.config"

DOTFILES="$HOME/hobbyist-dotfiles"

if [ -d "$DOTFILES" ]; then
  printf "[+] Applying dotfiles...\n"
  cd ~/hobbyist-dotfiles/
  stow -t ~/.config/ Configs/
  stow -t ~/.config/ Plasma/

  printf "[+] Copying fonts and wallpapers...\n"
  cp -r "$DOTFILES/Configs/Resources/fonts/." ~/.local/share/fonts/
  cp -r "$DOTFILES/Wallpapers" ~/

  pkglist="$DOTFILES/Configs/installed-pkg/pkglist.txt"
  if [ -f "$pkglist" ]; then
    printf "[+] Installing packages from list...\n"
    xargs yay -S --needed --answerclean None --answerdiff None --noconfirm \
      < "$pkglist"
  fi

else
  printf "[!] Dotfiles repo not found at $DOTFILES — skipping dotfiles, resources, and package list.\n"
fi

if command -v fish &>/dev/null; then
  printf "[+] Setting fish as default shell for current user...\n"
  sudo chsh -s "$(command -v fish)" $USER
fi

if ! pacman -Q bluez bluez-utils &>/dev/null; then
  yay -S --needed --answerclean None --answerdiff None --noconfirm bluez bluez-utils && printf "bluez and bluez-utils installed successfully\n"
fi

if [[ -f /etc/vconsole.conf ]]; then
  printf "[+] Setting console font permanently to latarcyrheb-sun32\n"
  sudo sed -i '/^FONT=/c\FONT=latarcyrheb-sun32' /etc/vconsole.conf
fi

init=$(ps -p 1 -o comm=)
if [[ "$init" == "systemd" ]]; then
  sudo systemctl restart systemd-vconsole-setup.service

  printf "[+] Enabling Bluetooth...\n"
  sudo systemctl enable --now bluetooth.service
  sudo rfkill unblock bluetooth || true

  printf "[+] Setting Niri as default...\n"
  if [[ -f "$HOME/.config/systemd/user/niri.service" ]]; then
    systemctl --user daemon-reload
    systemctl --user enable niri.service
  fi

  printf "[+] Enabling mako sound...\n"
  if [[ -f "$HOME/.config/systemd/user/mako-sound.service" ]]; then
    systemctl --user daemon-reload
    systemctl --user enable --now mako-sound.service
  fi

else
  printf "[!] System is not running on systemd\n"
  printf "[!] Skipping systemd based services\n"
fi

printf "[+] Fixing bash config\n"
if [[ -f "$HOME/.config/Scripts/bashfix.sh" ]]; then
  bash "$HOME/.config/Scripts/bashfix.sh"
else
  printf "[!] bashfix not found\n"
fi

if [[ -f "$HOME/.local/share/icons/Tela/index.theme" ]]; then
  printf "[✓] Tela-icon-theme already installed\n"
else
  printf "[+] Installing Tela-icon-theme...\n"
  cd ~
  git clone https://github.com/vinceliuice/Tela-icon-theme.git
  cd ~/Tela-icon-theme
  bash install.sh
  rm -rf ~/Tela-icon*
fi

read -rp "Do you want to clean system ? (y/n) " answ

if [[ "$answ" == "y" ]]; then
  printf "[✓] Removing orphan packages...\n"

  if [[ -n "$(pacman -Qdtq)" ]]; then
    sudo pacman -Rns --noconfirm $(pacman -Qdtq)
  fi

  printf "[✓] Cleaning AUR dependencies...\n"
  yay -Yc --noconfirm

  printf "[✓] Cleaning package cache...\n"
  sudo rm -rf /var/cache/pacman/pkg/download-*/

  printf "[✓] Removing yay cache...\n"
  rm -rf ~/.cache/yay

  printf "[✓] Cleaning logs...\n"
  sudo journalctl --vacuum-time=7d

  printf "[✓] Cleanup done\n"
fi

printf "[✓] Setup completed successfully!\n"

read -rp "Do you want to reboot now ? (y/n) " status

if [[ "$status" == "y" ]]; then
  printf "Rebooting in 3 seconds\n"
  sleep 3

  if [[ "$init" == "systemd" ]]; then
    systemctl reboot
  else
    sudo reboot
  fi

else
  printf "That's okay"

fi
