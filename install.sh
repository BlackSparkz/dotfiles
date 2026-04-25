#!/usr/bin/env bash
set -euo pipefail

echo "[+] Starting Arch setup..."

# --- Install base packages ---
echo "[+] Installing base packages..."
sudo pacman -S --needed --noconfirm base-devel stow fish eza git

# --- Install yay (if not installed) ---
if ! command -v yay &>/dev/null; then
    echo "[+] Installing yay..."
    tmpdir=$(mktemp -d)
    trap 'rm -rf "$tmpdir"' EXIT
    git clone https://aur.archlinux.org/yay-bin.git "$tmpdir/yay-bin"
    (cd "$tmpdir/yay-bin" && makepkg -si --noconfirm)
else
    echo "[=] yay already installed"
fi

# --- Setup directories ---
echo "[+] Creating config directories..."
mkdir -p ~/.local/share/fonts

DOTFILES="$HOME/hobbyist-dotfiles"

# --- Apply dotfiles and copy resources ---
if [ -d "$DOTFILES" ]; then
    echo "[+] Applying dotfiles..."
    (cd "$DOTFILES" && stow -t ~/.config Configs)

    echo "[+] Copying fonts and wallpapers..."
    cp -r "$DOTFILES/Configs/Resources/fonts/." ~/.local/share/fonts/
    cp -r "$DOTFILES/Wallpapers" ~/

    # --- Install packages from list ---
    pkglist="$DOTFILES/Configs/installed-pkg/pkglist.txt"
    if [ -f "$pkglist" ]; then
        echo "[+] Installing packages from list..."
        xargs yay -S --needed --answerclean All --answerdiff None --noconfirm \
            < "$pkglist"
    fi
else
    echo "[!] Dotfiles repo not found at $DOTFILES — skipping dotfiles, resources, and package list."
fi

# --- Set fish as default shell ---
if command -v fish &>/dev/null; then
    echo "[+] Setting fish as default shell..."
    chsh -s "$(command -v fish)"
fi

# --- Enable Bluetooth ---
echo "[+] Enabling Bluetooth..."
sudo systemctl enable --now bluetooth.service
sudo rfkill unblock bluetooth || true

# --- Setting Niri as default ---
systemctl --user daemon-reload
systemctl --user enable niri.service

echo "[✓] Setup completed successfully!"
