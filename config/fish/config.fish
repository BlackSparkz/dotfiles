set -g fish_greeting ""

# ==============================
# Basic
# ==============================
alias c='clear'
alias q='exit'
alias e='exit'
alias h='history'
alias reload='source ~/.config/fish/config.fish'
alias kreload='kitty @ load-config'

# ==============================
# ls
# ==============================
alias ls="eza --icons=always -lah --group-directories-first"
alias lt='eza -a --tree --level=1 --icons=always'
alias top="btop"
alias cat="bat"
# alias cd="z"
alias tree='tree -C'
alias t='tree'

# ==============================
# Navigation
# ==============================
alias b='cd ..'
alias bb='cd ../..'
alias h='cd ~'
alias d='cd ~/Downloads'
alias do='cd ~/Dotfiles'

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
# alias pacup='sudo timeshift --create --comments "Before update" --tags O && sudo pacman -Syu --noconfirm && yay -Syu'
alias pacup='sudo timeshift --create --comments "Before update" --tags O && yay -Syu && yay -Yc'
alias paci='yay -S --needed'
alias pacr='yay -Rns'

# ==============================
# System / Power
# ==============================
alias logout='loginctl terminate-user $USER'
alias reboot='systemctl reboot'
alias re='systemctl reboot'
alias restart='systemctl reboot'
alias shutdown='systemctl poweroff'
alias off='systemctl poweroff'
alias switchoff='systemctl poweroff'
alias poweroff='systemctl poweroff'
alias suspend='systemctl suspend'

# ==============================
# System
# ==============================
alias grubup='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias ff='fastfetch'
alias ports='ss -tulpn'
alias ram='free -h'
alias mem='free -h'
alias storage='df -h'
alias dfh='df -h'
alias duh='du -h --max-depth=1'
alias cpu='lscpu'
alias disk='lsblk'
alias mounts='mount | column -t'
alias info='hostnamectl'
alias battery='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
alias batt='upower -i /org/freedesktop/UPower/devices/battery_BAT0'

# ==============================
# Network (FIX: ip conflict)
# ==============================
alias myip='curl ifconfig.me'
alias pingg='ping -c 5 archlinux.org'
alias wifi='nmtui'

# ==============================
# Git
# ==============================
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"

# ==============================
# Process
# ==============================
alias top='btop'
alias py='python3'

# zoxide init fish | source

# starship init fish | source
