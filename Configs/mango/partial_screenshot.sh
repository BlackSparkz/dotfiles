#!/bin/bash

# =========================
# ⚙️ CONFIG
# =========================

DIR="$HOME/Pictures/Screenshots"
DEVICE_NAME=""
SOUND="/usr/share/sounds/freedesktop/stereo/screen-capture.oga"

mkdir -p "$DIR"
TIME=$(date +"%d-%m-%Y_%H-%M-%S")
FILE="$DIR/Screenshot_${TIME}.png"

# =========================
# 🖥️ WAYLAND CHECK
# =========================

if [ -z "$WAYLAND_DISPLAY" ]; then
    notify-send "❌ Not running in Wayland"
    exit 1
fi

# =========================
# 🖱️ AREA SELECT
# =========================

GEOM=$(slurp 2>/dev/null)

# cancel case
if [ -z "$GEOM" ]; then
    notify-send "❌ Screenshot cancelled"
    exit 0
fi

# =========================
# 📸 SCREENSHOT
# =========================

if ! grim -g "$GEOM" "$FILE"; then
    notify-send "❌ Screenshot failed (grim error)"
    exit 1
fi

# copy to clipboard
wl-copy < "$FILE"

# =========================
# 🔊 SOUND
# =========================

[ -f "$SOUND" ] && paplay "$SOUND" &

# =========================
# 📱 KDE CONNECT
# =========================

if ! pgrep -x kdeconnectd >/dev/null; then
    kdeconnectd &
    sleep 2
fi

if [ -n "$DEVICE_NAME" ]; then
    DEVICE_ID=$(kdeconnect-cli -a | grep "$DEVICE_NAME" | cut -d':' -f1)
else
    DEVICE_ID=$(kdeconnect-cli -a --id-only | head -n 1)
fi

if [ -n "$DEVICE_ID" ]; then
    kdeconnect-cli -d "$DEVICE_ID" --share "$FILE" && \
    notify-send "Sent to your phone" "$(basename "$FILE")"
else
    notify-send "⚠️ No device found" "Saved locally"
fi
