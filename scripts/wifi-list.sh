#!/usr/bin/env bash

# Проверяем состояние Wi-Fi
wifi_state=$(nmcli radio wifi)

if [ "$wifi_state" = "disabled" ]; then
    nmcli radio wifi on
    sleep 2
fi

# Сканируем сети
nmcli device wifi rescan

# Получаем список сетей
networks=$(nmcli --fields SSID,SECURITY,SIGNAL device wifi list | sed '1d' | sort -u)

# Форматируем вывод для Wofi
formatted=$(echo "$networks" | awk -F'  +' '{
    signal = $3
    security = $2
    ssid = $1

    # Иконки для силы сигнала
    if (signal >= 75) icon = "󰤨"
    else if (signal >= 50) icon = "󰤥"
    else if (signal >= 25) icon = "󰤢"
    else icon = "󰤟"

    # Иконки для типа защиты
    if (security ~ /WPA2|WPA3/) sec_icon = ""
    else if (security ~ /WEP/) sec_icon = ""
    else sec_icon = ""

    printf "%s %s %s (%-3s%%) %s\n", icon, sec_icon, ssid, signal, security
}')

# Показываем меню через Wofi
chosen=$(echo "$formatted" | wofi --dmenu -p "Wi-Fi Networks:")

[ -n "$chosen" ] || exit