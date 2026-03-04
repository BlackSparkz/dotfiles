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
alias ls="eza --icons --group-directories-first"
alias ll="eza -lh --icons"
alias la="eza -lha --icons"
alias top="btop"
alias cat="bat --style=header,grid"
alias cd="z"
alias tree='tree -C'
alias t='tree'

# ==============================
# Navigation
# ==============================
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias home='cd ~'
alias desk='cd ~/Desktop'
alias d='cd ~/Downloads'
alias docs='cd ~/Documents'

# ==============================
# Safe file operations
# ==============================
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

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
# System info
# ==============================
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

# ==============================
# Process
# ==============================
alias top='btop'
alias py='python3'

set -g fish_greeting ""

zoxide init fish | source

# starship init fish | source
