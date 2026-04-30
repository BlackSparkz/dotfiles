#!/bin/bash

WALLPAPER_DIR="$HOME/Wallpapers"
THUMB_DIR="$HOME/.cache/wallpaper_thumbs"
ROFI_THEME="$HOME/.config/rofi/wallpaper-selector.rasi"
MAPPING_FILE="/tmp/wallpaper_mapping_$$"

mkdir -p "$THUMB_DIR"
trap 'rm -f "$MAPPING_FILE"' EXIT

# ── dependency check ────────────────────────────────────────────────────────
for cmd in rofi swaybg; do
    command -v "$cmd" &>/dev/null || { echo "$cmd is not installed."; exit 1; }
done

if ! command -v magick &>/dev/null && ! command -v convert &>/dev/null; then
    echo "ImageMagick is required for thumbnail generation."
    exit 1
fi
convert_cmd=$(command -v magick || command -v convert)

# ── helpers ──────────────────────────────────────────────────────────────────
# Tab-delimited mapping: display_name \t full_path
# Tabs cannot appear in filenames on Linux, so this is a safe delimiter.

collect_images() {
    shopt -s nullglob nocaseglob
    for img in "$WALLPAPER_DIR"/*.{jpg,jpeg,png,webp,bmp,gif}; do
        [[ -f "$img" ]] && printf '%s\n' "$img"
    done
    shopt -u nullglob nocaseglob
}

needs_thumbnails() {
    while IFS= read -r img; do
        local name thumb
        name=$(basename "${img%.*}")
        thumb="$THUMB_DIR/${name}_thumb.png"
        [[ ! -f "$thumb" || "$img" -nt "$thumb" ]] && return 0
    done < <(collect_images)
    return 1
}

generate_thumbnails() {
    while IFS= read -r img; do
        local name thumb
        name=$(basename "${img%.*}")
        thumb="$THUMB_DIR/${name}_thumb.png"
        if [[ ! -f "$thumb" || "$img" -nt "$thumb" ]]; then
            ffmpeg -y -i "$img" \
                -vf "scale=480:270:force_original_aspect_ratio=increase,crop=480:270" \
                -frames:v 1 "$thumb" &>/dev/null
        fi
    done < <(collect_images)
}

build_rofi_input() {
    # Writes MAPPING_FILE and emits rofi-ready lines to stdout
    : > "$MAPPING_FILE"
    while IFS= read -r img; do
        local filename name thumb
        filename=$(basename "$img")
        name="${filename%.*}"
        thumb="$THUMB_DIR/${name}_thumb.png"

        printf '%s\t%s\n' "$name" "$img" >> "$MAPPING_FILE"

        if [[ -f "$thumb" ]]; then
            printf '%s\x00icon\x1f%s\n' "$name" "$thumb"
        else
            printf '%s\n' "$name"
        fi
    done < <(collect_images)
}

# ── thumbnail generation ─────────────────────────────────────────────────────
if needs_thumbnails; then
    # Show a spinner rofi while generating; kill it once done
    echo "⏳ Generating thumbnails…" | rofi -dmenu \
        -p "" \
        -no-custom \
        -theme "$ROFI_THEME" \
        -theme-str 'listview { lines: 0; } inputbar { enabled: false; }' \
        &>/dev/null &
    SPINNER_PID=$!

    generate_thumbnails

    kill "$SPINNER_PID" 2>/dev/null
    wait "$SPINNER_PID" 2>/dev/null
    sleep 0.1   # let rofi window close
fi

# ── rofi selection ───────────────────────────────────────────────────────────
selection=$(build_rofi_input | rofi -dmenu -i \
    -p "" \
    -show-icons \
    -theme "$ROFI_THEME")

[[ -z "$selection" ]] && exit 0

# Lookup full path via tab-delimited mapping (awk is delimiter-exact)
selected_path=$(awk -F'\t' -v sel="$selection" '$1 == sel { print $2; exit }' "$MAPPING_FILE")

if [[ ! -f "$selected_path" ]]; then
    echo "Error: resolved path not found — '$selected_path'"
    exit 1
fi

# ── apply wallpaper ──────────────────────────────────────────────────────────

# Persist path for hypr session restore
if [[ -f "$HOME/.config/hypr/shellwrapper.sh" ]]; then
    sed -i "s|^WALLPAPER=.*|WALLPAPER=\"$selected_path\"|" \
        "$HOME/.config/hypr/shellwrapper.sh"
fi

# Pywal (optional — skip if wal not found)
WAL="$HOME/.local/bin/wal"
if command -v "$WAL" &>/dev/null || command -v wal &>/dev/null; then
    "${WAL:-wal}" -i "$selected_path"
    sleep 2
fi

# swaybg
pkill -x swaybg 2>/dev/null
swaybg -i "$selected_path" -m fill &
notify-send "Wallpaper Changed" "$(basename "$selected_path")"
