#!/bin/bash
export HYPRLAND_INSTANCE_SIGNATURE=$(hyprctl -j info | jq -r '.signature')
HYPRLAND_SOCK="/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE.sock"

socat - UNIX-CONNECT:"$HYPRLAND_SOCK" | while read -r line; do
  if echo "$line" | grep -q "keyboard"; then
    layout=$(hyprctl -j devices | jq -r '.keyboards[] | select(.main == true) | .active_keymap' | awk '{print toupper(substr($1,1,2))}')
    echo "$layout"
  fi
done
