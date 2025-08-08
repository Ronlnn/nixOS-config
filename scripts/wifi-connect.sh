#!/usr/bin/env bash

# Если выбрано отключение
if [[ "$1" == "disconnect" ]]; then
    active_connection=$(nmcli -t -f NAME connection show --active | grep -v '^lo$\|^docker' | head -n1)
    if [ -n "$active_connection" ]; then
        if nmcli connection down "$active_connection"; then
            notify-send "Wi-Fi" "Disconnected from $active_connection"
        else
            notify-send "Wi-Fi" "Failed to disconnect" --urgency=critical
        fi
    else
        notify-send "Wi-Fi" "No active connection to disconnect"
    fi
    exit 0
fi

# Если переданы параметры сети
if [ "$1" = "connect" ] && [ -n "$2" ]; then
    # Извлекаем SSID
    ssid=$(echo "$2" | awk '{for(i=3;i<NF-1;i++) printf $i" "; print $(NF-1)}' | sed 's/ *$//')

    # Извлекаем тип безопасности
    security=$(echo "$2" | awk '{print $NF}')

    # Проверяем, защищена ли сеть
    if [ "$security" != "--" ]; then
        # Запрашиваем пароль
        password=$(wofi --dmenu -p "Password for $ssid:" --password)
        [ -n "$password" ] || exit

        # Удаляем старый профиль, если существует
        nmcli connection delete "$ssid" 2>/dev/null

        # Создаем новый профиль подключения
        if nmcli connection add \
            type wifi \
            con-name "$ssid" \
            ifname wlo1 \
            ssid "$ssid" \
            wifi-sec.key-mgmt wpa-psk \
            wifi-sec.psk "$password"; then

            # Пытаемся подключиться
            if nmcli connection up "$ssid"; then
                notify-send "Wi-Fi" "Connected to $ssid"
            else
                notify-send "Wi-Fi" "Failed to connect to $ssid" --urgency=critical
            fi
        else
            notify-send "Wi-Fi" "Failed to create profile for $ssid" --urgency=critical
        fi
    else
        # Подключаемся к открытой сети
        if nmcli device wifi connect "$ssid"; then
            notify-send "Wi-Fi" "Connected to $ssid"
        else
            notify-send "Wi-Fi" "Failed to connect to $ssid" --urgency=critical
        fi
    fi
fi