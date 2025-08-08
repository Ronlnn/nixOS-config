#!/usr/bin/env bash

# Проверяем, выбрано ли отключение
if [[ "$1" == "disconnect" ]]; then
    # Получаем имя активного подключения
    active_connection=$(nmcli -t -f NAME connection show --active | grep -v '^lo$' | head -n1)

    if [ -n "$active_connection" ]; then
        nmcli connection down "$active_connection"
        notify-send "Wi-Fi" "Disconnected from $active_connection"
    else
        notify-send "Wi-Fi" "No active connection to disconnect"
    fi
    exit 0
fi

# Если переданы параметры сети
if [ -n "$1" ]; then
    # Извлекаем SSID из выбранного пункта
    ssid=$(echo "$1" | awk '{print $3}')

    # Проверяем, защищена ли сеть
    security=$(echo "$1" | awk '{print $5}')

    if [ "$security" != "--" ]; then
        # Запрашиваем пароль
        password=$(wofi --dmenu -p "Password for $ssid:" --password)
        [ -n "$password" ] || exit
    fi

    # Подключаемся к сети
    if [ -n "$password" ]; then
        nmcli device wifi connect "$ssid" password "$password"
    else
        nmcli device wifi connect "$ssid"
    fi

    # Уведомление о результате
    if [ $? -eq 0 ]; then
        notify-send "Wi-Fi" "Connected to $ssid"
    else
        notify-send "Wi-Fi" "Failed to connect to $ssid" --urgency=critical
    fi
fi