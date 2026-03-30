#!/bin/bash

# =========================
# ⚙️ CONFIG
# =========================

DIR="$HOME/Pictures/Screenshots"
DEVICE_NAME=""   # Optional (recommended: apna phone name daal)

SOUND="/usr/share/sounds/freedesktop/stereo/screen-capture.oga"

# =========================
# 📸 SETUP
# =========================

mkdir -p "$DIR"
TIME=$(date +"%d-%m-%Y_%H-%M-%S")
FILE="$DIR/Screenshot_${TIME}.png"

# =========================
# 📸 SCREENSHOT
# =========================

if ! grim - | tee "$FILE" | wl-copy; then
    notify-send "❌ Screenshot failed"
    exit 1
fi

# =========================
# 🔊 PLAY SOUND
# =========================

if [ -f "$SOUND" ]; then
    paplay "$SOUND" &
fi

# =========================
# ⏳ FILE READY CHECK
# =========================

for i in {1..10}; do
    [ -f "$FILE" ] && break
    sleep 0.2
done

# =========================
# 🔌 KDE CONNECT READY
# =========================

if ! pgrep -x kdeconnectd >/dev/null; then
    kdeconnectd &
    sleep 2
fi

# =========================
# 📱 DEVICE DETECTION
# =========================

if [ -n "$DEVICE_NAME" ]; then
    DEVICE_ID=$(kdeconnect-cli -a | grep "$DEVICE_NAME" | cut -d':' -f1)
else
    DEVICE_ID=$(kdeconnect-cli -a --id-only | head -n 1)
fi

# =========================
# 📤 SEND FILE
# =========================

if [ -n "$DEVICE_ID" ]; then
    if kdeconnect-cli -d "$DEVICE_ID" --share "$FILE"; then
        notify-send "Sent to your phone" "$(basename "$FILE")"
    else
        notify-send "⚠️ Send failed" "Saved locally"
    fi
else
    notify-send "⚠️ No device found" "Saved locally"
fi
