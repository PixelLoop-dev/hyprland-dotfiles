#!/bin/bash


choice=$(printf " Lock\n Suspend\n Reboot\n Shutdown" | \
  wofi --dmenu --prompt "Power menu" \
    --conf ~/.config/wofi/power-menu/config \
    --style ~/.config/wofi/power-menu/style.css)

case "$choice" in
  *Lock)
    swaylock
    ;;
  *Suspend)
    systemctl suspend
    ;;
  *Reboot)
    systemctl reboot
    ;;
  *Shutdown)
    systemctl poweroff
    ;;
esac