set -g fish_greeting ""

# ==============================
# Basic
# ==============================
alias c='clear'
alias h='history'
alias reload='source ~/.config/fish/config.fish ; kitty @ load-config'

# ==============================
# ls
# ==============================
alias ls="eza --no-time --reverse --no-filesize --no-permissions --no-user --icons=always -hl --group-directories-first"
alias lt='eza -a --tree --level=1 --icons=always'
alias cat="bat"
alias tree='tree -C'

# ==============================
# Navigation
# ==============================
alias b='cd ..'
alias h='cd ~'
alias d='cd ~/Downloads'

# ==============================
# Fedora (dnf)
# ==============================
alias dnfup='sudo dnf upgrade --refresh'
alias dnfi='sudo dnf install'
alias dnfr='sudo dnf remove'

# ==============================
# Debian based
# ==============================
alias aptup='sudo apt update && sudo apt upgrade -y'
alias apti='sudo apt install'
alias aptr='sudo apt remove'

# ==============================
# Arch based
# ==============================
alias pacup='sudo timeshift --create --comments "Before update" --tags O && yay -Syu'
alias paci='yay -S --needed'
alias pacr='yay -Rns'

# ==============================
# Power control
# ==============================
alias logout='loginctl terminate-user $USER'
alias reboot='systemctl reboot'
alias off='systemctl poweroff'
alias suspend='systemctl suspend ; bash ~/.config/hypr/randomwall.sh'

# ==============================
# System
# ==============================
alias grubup='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias ts='sudo timeshift --create --comments "Manual" --tags O'
alias tsd='sudo timeshift --delete-all'
alias tsl='sudo timeshift --list'
alias timeshift='sudo timeshift-gtk'
alias gparted='sudo -E gparted'
alias ff='fastfetch'
alias ram='free -h'
alias storage='df -h'
alias cpu='lscpu'
alias disk='lsblk'
alias info='hostnamectl'

# ==============================
# Network
# ==============================
alias pingg='ping -c 5 archlinux.org'
alias wifi='nmtui'
alias bt='bluetui'

# zoxide init fish | source
# starship init fish | source
