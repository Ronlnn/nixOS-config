#!/usr/bin/env bash

LAYOUT=$(hyprctl devices | grep -A 2 'xiaomi-keyboard-tkl-87' | grep 'active keymap' | awk -F': ' '{print $2}')
case "$LAYOUT" in
  "English (US)")
    echo "us"
    ;;
  "Russian")
    echo "ru"
    ;;
  *)
    echo "$LAYOUT"
    ;;
esac
