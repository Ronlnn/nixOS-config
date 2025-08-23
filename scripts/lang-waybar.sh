#!/usr/bin/env bash

LAYOUT=$(hyprctl devices | grep -A 2 'at-xiaomi-keyboard-tkl-87' | grep 'active keymap' | awk '{ print $3 }')
if [[ "$LAYOUT" == "English" ]]; then
    echo "us"
else
    echo "ru"
fi