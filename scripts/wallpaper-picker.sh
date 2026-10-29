#!/bin/bash

WALLPAPER_DIR="$HOME/Pics/wallpapers"

if [ ! -d "$WALLPAPER_DIR" ]; then
    notify-send "Ошибка" "Папка $WALLPAPER_DIR не найдена"
    exit 1
fi

SELECTED=$(find "$WALLPAPER_DIR" -maxdepth 1 -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \) -printf "%f\n" | sort | wofi --dmenu --prompt "Выбери обои:")

if [ -z "$SELECTED" ]; then
    exit 0
fi

FULL_PATH="$WALLPAPER_DIR/$SELECTED"

# Отправляем команду в hyprpaper с пустым монитором (все мониторы)
hyprctl hyprpaper wallpaper ",$FULL_PATH"

notify-send "Обои изменены" "$SELECTED"