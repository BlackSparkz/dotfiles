#!/usr/bin/env bash

ANIME_DIR="$HOME/hobbyist-dotfiles/Configs/hypr/hyprland_modules/Animations/"
STATE_FILE="/tmp/anime_index"

mapfile -t FILES < <(find "$ANIME_DIR" -type f | sort)

INDEX=$(cat "$STATE_FILE" 2>/dev/null || echo 0)

ANIME="${FILES[$INDEX]}"

FOR_NOTIFICATION=$(basename "$ANIME" .lua)

CLEAN=$(echo "$ANIME" | sed -e 's|.*hyprland_modules/|hyprland_modules/|' -e 's|\.lua$||')

FINAL="require(\"$CLEAN\")"

sed -i "s|^require(\"hyprland_modules/Animations/.*|$FINAL|" \
"$HOME/hobbyist-dotfiles/Configs/hypr/hyprland.lua" && \
notify-send "Animations changed" "$FOR_NOTIFICATION" && \
hyprctl reload

INDEX=$((INDEX + 1))
if (( INDEX >= ${#FILES[@]} )); then
    INDEX=0
fi

echo "$INDEX" > "$STATE_FILE"
