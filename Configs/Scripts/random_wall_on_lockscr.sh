#!/bin/bash

DIR="$HOME/Wallpapers"

IMG=$(find "$DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.webp" \) | shuf -n 1)

cp "$IMG" ~/.cache/hyprlock_wall.png

hyprlock
