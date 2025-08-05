#!/usr/bin/env bash


direction=$1

# Получаем строку с номером воркспейса
# Используем head, grep и tr, чтобы получить только первое число
current=$(hyprctl activeworkspace | head -1 | grep -o '[0-9]\+' | head -1)

if [[ -z "$current" ]]; then
  echo "Cannot determine current workspace"
  exit 1
fi

if [[ "$direction" == "+1" ]]; then
  new=$((current + 1))
elif [[ "$direction" == "-1" ]]; then
  new=$((current - 1))
else
  echo "Usage: $0 +1|-1"
  exit 1
fi

# Ограничиваем номер в диапазоне 1-10
if (( new < 1 )); then
  new=1
elif (( new > 10 )); then
  new=10
fi

echo "Switching from workspace $current to $new"
hyprctl dispatch workspace "$new"