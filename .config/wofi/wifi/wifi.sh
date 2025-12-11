#!/bin/bash

IFACE="wlan0"

# включаем wifi если выключен
nmcli radio wifi on

# сканируем сети
networks=$(nmcli -f IN-USE,SECURITY,SSID device wifi list ifname "$IFACE" | sed 1d)

choice=$(echo "$networks" | \
  sed 's/^*/* /' | \
  wofi --dmenu --prompt "Wi-Fi" \
    --conf ~/.config/wofi/power-menu/config \
    --style ~/.config/wofi/power-menu/style.css)

[ -z "$choice" ] && exit 0

ssid=$(echo "$choice" | sed 's/^* //' | awk '{$1=$2=""; print substr($0,3)}')

# проверяем, уже подключены или нет
if nmcli -t -f ACTIVE,SSID dev wifi | grep -q "^yes:$ssid$"; then
  nmcli device disconnect "$IFACE"
  notify-send "Wi-Fi" "Отключено от $ssid"
  exit 0
fi

# пробуем подключиться
if nmcli device wifi connect "$ssid" ifname "$IFACE"; then
  notify-send "Wi-Fi" "Подключено к $ssid"
else
  pass=$(wofi --dmenu --password --prompt "Пароль для $ssid" \
    --conf ~/.config/wofi/power-menu/config \
    --style ~/.config/wofi/power-menu/style.css)
  [ -z "$pass" ] && exit 1
  nmcli device wifi connect "$ssid" password "$pass" ifname "$IFACE" \
    && notify-send "Wi-Fi" "Подключено к $ssid"
fi
