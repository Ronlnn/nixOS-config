#!/usr/bin/env bash

# Проверяем, является ли скрипт основным или вызывается для подключения/отключения
if [ "$1" = "connect" ] || [ "$1" = "disconnect" ]; then
    ~/.config/waybar/scripts/wifi-connect.sh "$@"
    exit
fi

# Основной режим - показ списка сетей
chosen=$(~/.config/waybar/scripts/wifi-list.sh)

[ -n "$chosen" ] || exit

# Проверяем, выбрано ли отключение
if [[ "$chosen" == *"DISCONNECT"* ]]; then
    ~/.config/waybar/scripts/wifi-menu.sh disconnect
else
    ~/.config/waybar/scripts/wifi-menu.sh connect "$chosen"
fi