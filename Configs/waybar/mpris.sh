#!/usr/bin/env bash

set -u

fallback_text="Nothing is playing"

json_escape() {
  printf '%s' "$1" | sed 's/\\/\\\\/g; s/"/\\"/g'
}

player_icon() {
  case "$1" in
  *spotify*) printf '%s' " " ;;
  *firefox* | *zen*) printf '%s' " " ;;
  *chromium*) printf '%s' " " ;;
  *vlc*) printf '%s' "󰕼 " ;;
  *) printf '%s' "  " ;;
  esac
}

playing_player=""
paused_player=""
while IFS= read -r p; do
  [ -n "$p" ] || continue
  status="$(playerctl -p "$p" status 2>/dev/null || true)"
  if [ "$status" = "Playing" ]; then
    playing_player="$p"
    break
  fi
  if [ "$status" = "Paused" ] && [ -z "$paused_player" ]; then
    paused_player="$p"
  fi
done < <(playerctl -l 2>/dev/null || true)

target_player="$playing_player"
[ -n "$target_player" ] || target_player="$paused_player"

if [ -z "$target_player" ]; then
  printf '{"text":"%s","tooltip":"%s"}\n' "$(json_escape "$fallback_text")" "$(json_escape "$fallback_text")"
  exit 0
fi

status="$(playerctl -p "$target_player" status 2>/dev/null || true)"
title="$(playerctl -p "$target_player" metadata xesam:title 2>/dev/null || true)"
artist="$(playerctl -p "$target_player" metadata xesam:artist 2>/dev/null | paste -sd ', ' - || true)"
icon="$(player_icon "$target_player")"

[ -n "$title" ] || {
  printf '{"text":"%s","tooltip":"%s"}\n' "$(json_escape "$fallback_text")" "$(json_escape "$fallback_text")"
  exit 0
}

if [ "$status" = "Paused" ]; then
  text="⏸ $icon $title"
else
  text="$icon $title"
fi
tooltip="$title"
[ -n "$artist" ] && tooltip="$title - $artist"

printf '{"text":"%s","tooltip":"%s"}\n' "$(json_escape "$text")" "$(json_escape "$tooltip")"
