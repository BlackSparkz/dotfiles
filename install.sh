cp -r ~/hobbyist-dotfiles/Configs/Resources/fonts/ ~/.local/share/
cp -r ~/hobbyist-dotfiles/Wallpapers/ ~/Wallpapers
sudo systemctl enable --now bluetooth.service
sudo rfkill unblock bluetooth
