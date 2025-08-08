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
if [ -n "$1" ]; then
    # Извлекаем SSID
    ssid=$(echo "$1" | awk '{for(i=3;i<NF-1;i++) printf $i" "; print $(NF-1)}' | sed 's/ *$//')

    # Извлекаем тип безопасности
    security=$(echo "$1" | awk '{print $NF}')

    # Определяем метод аутентификации
    key_mgmt=""
    if [[ "$security" == "WPA"* ]]; then
        key_mgmt="wpa-psk"
    elif [[ "$security" == "WEP"* ]]; then
        key_mgmt="wep"
    fi

    if [ "$security" != "--" ]; then
        # Запрашиваем пароль
        password=$(wofi --dmenu -p "Password for $ssid:" --password)
        [ -n "$password" ] || exit


            # Пробуем без явного указания метода
            if nmcli device wifi connect "$ssid" password "$password"; then
                notify-send "Wi-Fi" "Connected to $ssid"
            else
                notify-send "Wi-Fi" "Failed to connect to $ssid" --urgency=critical
            fi
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