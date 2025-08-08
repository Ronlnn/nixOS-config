#!/usr/bin/env bash

# Проверяем, является ли скрипт основным или вызывается для подключения
if [ "$1" = "connect" ]; then
    shift
    ~/nixOS-config/scripts/wifi-connect.sh "$@"
    exit
fi

# Основной режим - показ списка сетей
chosen=$(~/nixOS-config/scripts/wifi-list.sh)

[ -n "$chosen" ] || exit

# Запускаем скрипт подключения
~/nixOS-config/scripts/wifi-menu.sh connect "$chosen"