#!/bin/bash

hour=$(date +%H)

if [ "$hour" -ge 5 ] && [ "$hour" -lt 12 ]; then
  echo "Good Morning"
elif [ "$hour" -ge 12 ] && [ "$hour" -lt 17 ]; then
  echo "Good Afternoon"
elif [ "$hour" -ge 17 ] && [ "$hour" -lt 21 ]; then
  echo "Good Evening"
else
  echo "Good Night"
fi
