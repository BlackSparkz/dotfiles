#!/usr/bin/env bash

theme="$HOME/.config/rofi/clipboard.rasi"

options="Poweroff\nReboot\nSuspend\nLock\nLogout"

chosen="$(echo -e "$options" | rofi -dmenu -theme "$theme")" || exit 0

case "$chosen" in
    Poweroff) systemctl poweroff ;;
    Reboot)   systemctl reboot ;;
    Suspend)  systemctl suspend ;;
    Lock)     bash ~/.config/Scripts/random_wall_on_lockscr.sh ;;
    Logout)   loginctl terminate-user "$USER" ;;
esac
