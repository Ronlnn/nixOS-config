#!/usr/bin/env bash

LAYOUT=$(hyprctl devices | grep -A 2 'at-translated-set-2-keyboard' | grep 'active keymap' | awk '{ print $3 }')
if [[ "$LAYOUT" == "English" ]]; then
    echo "us"
else
    echo "ru"
fi