#!/usr/bin/env bash
set -euo pipefail

echo "[+] Starting Arch setup..."

# --- Install base packages ---
echo "[+] Installing base packages..."
sudo pacman -S --needed --noconfirm base-devel stow fish eza git

# --- Install yay (if not installed) ---
if ! command -v yay &>/dev/null; then
    echo "[+] Installing yay..."
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin
    makepkg -si --noconfirm
    cd ..
    rm -rf yay-bin
else
    echo "[=] yay already installed"
fi

# --- Setup directories ---
echo "[+] Creating config directories..."
mkdir -p ~/.config
mkdir -p ~/.local/share

# --- Apply dotfiles ---
if [ -d "$HOME/hobbyist-dotfiles" ]; then
    echo "[+] Applying dotfiles..."
    cd ~/hobbyist-dotfiles
    stow -t ~/.config Configs
else
    echo "[!] Dotfiles repo not found!"
fi

# --- Copy resources ---
echo "[+] Copying fonts and wallpapers..."
cp -r ~/hobbyist-dotfiles/Configs/Resources/fonts ~/.local/share/ || true
cp -r ~/hobbyist-dotfiles/Wallpapers ~/ || true

# --- Install packages from list ---
if [ -f ~/hobbyist-dotfiles/Configs/installed-pkg/pkglist.txt ]; then
    echo "[+] Installing packages from list..."
    yay -S --needed --answerclean All --answerdiff None < ~/hobbyist-dotfiles/Configs/installed-pkg/pkglist.txt
fi

# --- Set fish shell ---
if command -v fish &>/dev/null; then
    echo "[+] Setting fish as default shell..."
    chsh -s "$(which fish)"
fi

# --- Enable Bluetooth ---
echo "[+] Enabling Bluetooth..."
sudo systemctl enable --now bluetooth.service
sudo rfkill unblock bluetooth || true

echo "[✓] Setup completed successfully!"
