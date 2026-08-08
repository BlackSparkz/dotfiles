#!/bin/bash

TMPFILE=$(mktemp)

for f in /usr/share/applications/*.desktop ~/.local/share/applications/*.desktop; do
  [[ -f "$f" ]] || continue
  grep -q "^NoDisplay=true" "$f" && continue
  grep -q "^Hidden=true" "$f" && continue
  name=$(grep "^Name=" "$f" | head -1 | cut -d= -f2)
  exec=$(grep "^Exec=" "$f" | head -1 | cut -d= -f2- | sed 's/%[uUfFdDnNickvm]//g' | sed 's/--$//' | sed 's/[[:space:]]*$//')
  [[ -n "$name" && -n "$exec" ]] && echo "$name|$exec" >> "$TMPFILE"
done

chosen=$(sort -u "$TMPFILE" | cut -d'|' -f1 | fzf --prompt=" Launch: " --reverse --border --height=40%)

if [[ -n "$chosen" ]]; then
  exec_cmd=$(awk -F'|' -v name="$chosen" '$1 == name {print $2; exit}' "$TMPFILE")
  rm "$TMPFILE"
  systemd-run --user --no-block bash -c "$exec_cmd"
else
  rm "$TMPFILE"
fi
