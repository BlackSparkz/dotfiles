#!/usr/bin/env bash

WALL_DIR="$HOME/Wallpapers"
THEME_DIR="$HOME/.config/hypr/hyprlock_themes"

WALL_HISTORY="$HOME/.cache/hyprlock_wall_history"
THEME_HISTORY="$HOME/.cache/hyprlock_theme_history"

pick_no_repeat() {
    local dir="$1"
    local history="$2"
    local find_args=("${@:3}")

    touch "$history"

    local all
    all=$(find "$dir" "${find_args[@]}" | sort)
    local total
    total=$(echo "$all" | wc -l)

    # Reset history if all entries seen
    local seen
    seen=$(wc -l < "$history")
    [[ "$seen" -ge "$total" ]] && > "$history"

    local pick
    pick=$(comm -23 \
        <(echo "$all") \
        <(sort "$history") \
        | shuf -n 1)

    echo "$pick" >> "$history"
    echo "$pick"
}

IMG=$(pick_no_repeat "$WALL_DIR" "$WALL_HISTORY" \
    -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.webp" \))

THEME=$(pick_no_repeat "$THEME_DIR" "$THEME_HISTORY" \
    -type f)

cp "$IMG" ~/.cache/hyprlock_wall.png
hyprlock -c "$THEME"
