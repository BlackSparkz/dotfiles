#!/bin/bash

SOUND="/usr/share/sounds/freedesktop/stereo/message.oga"

dbus-monitor "interface='org.freedesktop.Notifications'" |
while read -r line; do
    if [[ "$line" == *"member=Notify"* ]]; then
        paplay "$SOUND" &
    fi
done
