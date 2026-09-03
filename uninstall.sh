#!/usr/bin/env bash

set -euo pipefail

DOTFILES="$HOME/hobbyist-dotfiles"

printf "[+] Starting Hobbyist dotfiles teardown...\n"

# --- unstow dotfiles ---
if [ -d "$DOTFILES" ]; then
  printf "[+] Unstowing dotfiles...\n"
  cd ~/hobbyist-dotfiles/
  stow -D -t ~/.config Configs
  stow -D -t ~/.config Plasma
fi

pkglist="$DOTFILES/Configs/installed-pkg/pkglist.txt"
  if [ -f "$pkglist" ]; then
    read -rp "Remove packages listed in pkglist.txt? (y/n) " rmpkg
    if [[ "$rmpkg" == "y" ]]; then
      printf "[+] Removing packages from list...\n"
      xargs -r sudo pacman -Rns --noconfirm < "$pkglist" || true
    fi
  fi

# --- fonts / wallpapers copied in ---
read -rp "Remove fonts and wallpapers copied by install.sh? (y/n) " rmassets
if [[ "$rmassets" == "y" ]]; then
  if [ -d "$DOTFILES/Configs/Resources/fonts" ]; then
    printf "[+] Removing copied fonts...\n"
    for f in "$DOTFILES/Configs/Resources/fonts/"*; do
      rm -rf -- "$HOME/.local/share/fonts/$(basename "$f")"
    done
  fi
  printf "[+] Removing ~/Wallpapers...\n"
  rm -rf ~/Wallpapers
fi

# --- shell revert ---
if [[ "$SHELL" == *fish* ]]; then
  read -rp "Revert default shell from fish to bash? (y/n) " revshell
  if [[ "$revshell" == "y" ]]; then
    printf "[+] Setting bash as default shell for current user...\n"
    sudo chsh -s "$(command -v bash)" "$USER"
  fi
fi

# --- bluetooth ---
read -rp "Disable and remove bluez/bluez-utils? (y/n) " rmbt
if [[ "$rmbt" == "y" ]]; then
  init=$(ps -p 1 -o comm=)
  if [[ "$init" == "systemd" ]]; then
    printf "[+] Disabling Bluetooth service...\n"
    sudo systemctl disable --now bluetooth.service || true
  fi
  if pacman -Q bluez bluez-utils &>/dev/null; then
    printf "[+] Removing bluez and bluez-utils...\n"
    sudo pacman -Rns --noconfirm bluez bluez-utils
  fi
fi

# --- console font revert ---
if [[ -f /etc/vconsole.conf ]]; then
  read -rp "Revert console font in /etc/vconsole.conf? (y/n) " revfont
  if [[ "$revfont" == "y" ]]; then
    printf "[+] Removing FONT= override from /etc/vconsole.conf\n"
    sudo sed -i '/^FONT=/d' /etc/vconsole.conf
    init=$(ps -p 1 -o comm=)
    if [[ "$init" == "systemd" ]]; then
      sudo systemctl restart systemd-vconsole-setup.service || true
    fi
  fi
fi

# --- niri / mako-sound user services ---
init=$(ps -p 1 -o comm=)
if [[ "$init" == "systemd" ]]; then
  if [[ -f "$HOME/.config/systemd/user/niri.service" ]]; then
    printf "[+] Disabling niri.service...\n"
    systemctl --user disable niri.service || true
  fi
  if [[ -f "$HOME/.config/systemd/user/mako-sound.service" ]]; then
    printf "[+] Disabling mako-sound.service...\n"
    systemctl --user disable --now mako-sound.service || true
  fi
else
  printf "[!] System is not running on systemd — skipping systemd user service teardown\n"
fi

# --- Tela icon theme ---
if [[ -f "$HOME/.local/share/icons/Tela/index.theme" ]]; then
  read -rp "Remove Tela-icon-theme? (y/n) " rmtela
  if [[ "$rmtela" == "y" ]]; then
    printf "[+] Removing Tela icon theme...\n"
    rm -rf ~/.local/share/icons/Tela*
  fi
fi

# --- yay itself ---
if command -v yay &>/dev/null; then
  read -rp "Remove yay? (y/n) " rmyay
  if [[ "$rmyay" == "y" ]]; then
    printf "[+] Removing yay...\n"
    sudo pacman -Rns --noconfirm yay-bin 2>/dev/null || sudo pacman -Rns --noconfirm yay 2>/dev/null || true
  fi
fi

# --- base packages installed by install.sh ---
read -rp "Remove base packages (base-devel stow fish eza git)? (y/n) " rmbase
if [[ "$rmbase" == "y" ]]; then
  printf "[+] Removing base packages...\n"
  sudo pacman -Rns --noconfirm stow fish eza || true
  printf "[!] Skipping base-devel and git removal — likely depended on by other tooling; remove manually if intended.\n"
fi

# --- orphan cleanup ---
read -rp "Remove orphan packages and caches? (y/n) " answ
if [[ "$answ" == "y" ]]; then
  printf "[✓] Removing orphan packages...\n"
  if [[ -n "$(pacman -Qdtq)" ]]; then
    sudo pacman -Rns --noconfirm $(pacman -Qdtq)
  fi

  if command -v yay &>/dev/null; then
    printf "[✓] Cleaning AUR dependencies...\n"
    yay -Yc --noconfirm
  fi

  printf "[✓] Cleaning package cache...\n"
  sudo rm -rf /var/cache/pacman/pkg/download-*/

  printf "[✓] Removing yay cache...\n"
  rm -rf ~/.cache/yay

  printf "[✓] Cleanup done\n"
fi

printf "[✓] Teardown completed.\n"

read -rp "Do you want to reboot now ? (y/n) " status
if [[ "$status" == "y" ]]; then
  printf "Rebooting in 3 seconds\n"
  sleep 3
  init=$(ps -p 1 -o comm=)
  if [[ "$init" == "systemd" ]]; then
    systemctl reboot
  else
    sudo reboot
  fi
else
  printf "That's okay\n"
fi
