#!/usr/bin/env bash
# Упрощенная версия с ключевыми функциями

# Конфигурация
ICON_WIFI=""
ICON_LOCK=""
ICON_OFF="󰖪"
INTERFACE=$(nmcli -t -f DEVICE,TYPE device | awk -F: '$2=="wifi"{print $1;exit}')

show_menu() {
    networks=$(nmcli -t -g SSID,SECURITY,SIGNAL device wifi list | awk -F: '{
        security = $2 ? "'$ICON_LOCK' " $2 : ""
        printf "%-30s %s (%d%%)\n", $1, security, $3
    }')

    chosen=$(echo -e "$networks" | wofi --dmenu -p "Сети Wi-Fi:")
    [ -z "$chosen" ] && exit 0

    ssid=$(echo "$chosen" | awk '{print $1}')
    connect_to_network "$ssid"
}

connect_to_network() {
    local ssid="$1"

    # Проверка существующего профиля
    profile=$(nmcli -g NAME connection show | grep -F "$ssid" | head -n1)

    if [ -n "$profile" ]; then
        nmcli connection up "$profile" && notify-send "Подключено" "К $ssid" || \
        notify-send "Ошибка" "Не удалось подключиться"
        return
    fi

    # Определение безопасности
    security=$(nmcli -g SECURITY device wifi list | awk -F: -v ssid="$ssid" '$1==ssid{print $2}')

    if [ -n "$security" ]; then
        password=$(wofi --dmenu --password -p "Пароль для $ssid:")
        [ -z "$password" ] && return
    fi

    # Подключение
    if ! nmcli device wifi connect "$ssid" password "${password:-}" ifname "$INTERFACE"; then
        notify-send "Ошибка" "Не удалось подключиться к $ssid"
    else
        notify-send "Успех" "Подключено к $ssid"
    fi
}

# Главная функция
main() {
    if [ "$(nmcli radio wifi)" = "disabled" ]; then
        if echo -e "Включить Wi-Fi" | wofi --dmenu -p "Wi-Fi выключен:"; then
            nmcli radio wifi on
        fi
        exit 0
    fi

    show_menu
}

main