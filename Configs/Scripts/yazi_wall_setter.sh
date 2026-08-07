#!/bin/bash

WALL=$(echo $1)
types=(wipe any)
chosen=${types[$RANDOM % ${#types[@]}]}

ffmpeg -y -i "$WALL" -vf \
"split[orig][blur]; \
[blur]crop=iw*0.35:ih:0:0,gblur=sigma=80,eq=brightness=-0.10[bleft]; \
[orig][bleft]overlay=0:0" \
/tmp/partial_blured.jpg

awww img "$WALL" --transition-type "$chosen" --transition-fps 60 --transition-bezier 0.33,1.0,0.68,1.0 --transition-duration 1.6

NIRI=/tmp/blurred_wall.jpg

status=$(ps -C niri -o comm=)
if [[ $status == "niri" ]]; then
  ffmpeg -y -hwaccel vaapi -i "$WALL" -vf "format=yuv420p,boxblur=20:5,eq=contrast=1.1:saturation=1.8" "$NIRI"
  awww img --namespace niri "$NIRI" --transition-type "$chosen" --transition-fps 60 --transition-bezier 0.33,1.0,0.68,1.0 --transition-duration 1.6
fi

sleep 1 && notify-send "Wallpaper changed" "$(basename "$WALL")" -i "$WALL"
