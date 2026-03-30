#!/bin/bash

icons=("󰂎" "󱊡" "󱊢" "󱊣")
state_file="/tmp/battery_anim_index"

# init
[ ! -f "$state_file" ] && echo 0 > "$state_file"
i=$(cat "$state_file")

capacity=$(cat /sys/class/power_supply/BAT0/capacity)
status=$(cat /sys/class/power_supply/BAT0/status)

if [ "$capacity" -le 15 ]; then
    echo "{\"text\": \"󰂃 Connect charger $capacity%\", \"class\": \"critical\"}"

elif [ "$capacity" -le 25 ]; then
    echo "{\"text\": \"󰂃 Battery low $capacity%\", \"class\": \"warning\"}"

elif [[ "$status" == "Full" ]]; then
    echo "{\"text\": \"󰁹 Battery full $capacity%\", \"class\": \"full\"}"

elif [[ "$status" == "Charging" ]]; then
    echo "{\"text\": \"${icons[$i]} Charging $capacity%\", \"class\": \"charging\"}"
    i=$(( (i+1) % ${#icons[@]} ))
    echo $i > "$state_file"

else
    echo "{\"text\": \"󰁹 $capacity%\", \"class\": \"normal\"}"
fi
