#!/bin/bash

WALL_DIR="$HOME/Wallpapers"

WALL=$(find "$WALL_DIR" -type f | shuf -n 1)

pkill swaybg

swaybg -i "$WALL" -m fill &

notify-send "Wallpaper changed" "$(basename "$WALL")" -i "$WALL"
