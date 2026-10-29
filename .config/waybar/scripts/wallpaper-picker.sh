#!/bin/bash

WALLPAPER_DIR="$HOME/Pics/wallpapers"
CONFIG_FILE="$HOME/.config/hypr/hyprpaper.conf"

if [ ! -d "$WALLPAPER_DIR" ]; then
    notify-send "Ошибка" "Папка $WALLPAPER_DIR не найдена"
    exit 1
fi

SELECTED=$(find "$WALLPAPER_DIR" -maxdepth 1 -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \) -printf "%f\n" | sort | wofi --dmenu --prompt "Выбери обои:")

if [ -z "$SELECTED" ]; then
    exit 0
fi

FULL_PATH="$WALLPAPER_DIR/$SELECTED"

# 1. Меняем обои "на лету"
hyprctl hyprpaper wallpaper ",$FULL_PATH"

# 2. Обновляем конфиг под блочный формат
# Удаляем старый блок wallpaper { ... }
awk '
    /^wallpaper[[:space:]]*\{/ { in_block=1; next }
    in_block && /^\}/ { in_block=0; next }
    !in_block { print }
' "$CONFIG_FILE" > "$CONFIG_FILE.tmp" && mv "$CONFIG_FILE.tmp" "$CONFIG_FILE"

# 3. Добавляем новый блок в конец
cat >> "$CONFIG_FILE" <<EOF

wallpaper {
    monitor = 
    path = $FULL_PATH
}
EOF

notify-send "Обои изменены" "$SELECTED"