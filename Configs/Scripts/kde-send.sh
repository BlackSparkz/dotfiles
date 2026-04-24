#!/usr/bin/env bash

file="$1"

[ -z "$file" ] && exit 1

device=$(kdeconnect-cli -l --id-only | head -n 1)

if [ -z "$device" ]; then
    notify-send "KDE Connect" "No device found"
    exit 1
fi

kdeconnect-cli --share "$file" -d "$device" && \
notify-send "KDE Connect" "Sent: $(basename "$file")"
