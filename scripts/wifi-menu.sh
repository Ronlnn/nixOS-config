#!/usr/bin/env bash

# Проверяем, является ли скрипт основным или вызывается для подключения/отключения
if [ "$1" = "connect" ] || [ "$1" = "disconnect" ]; then
    ~/nixOS-config/scripts/wifi-connect.sh "$@"
    exit
fi

# Основной режим - показ списка сетей
chosen=$(~/nixOS-config/scripts/wifi-list.sh)

[ -n "$chosen" ] || exit

# Проверяем, выбрано ли отключение
if [[ "$chosen" == *"DISCONNECT"* ]]; then
    # Передаем только флаг disconnect
    ~/nixOS-config/scripts/wifi-menu.sh disconnect
else
    # Передаем весь выбранный текст
    ~/nixOS-config/scripts/wifi-menu.sh connect "$chosen"
fi