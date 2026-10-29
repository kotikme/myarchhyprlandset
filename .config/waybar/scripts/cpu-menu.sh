#!/bin/bash

# ============================================
# Меню выбора режима процессора (через терминал)
# ============================================

echo "Выбери режим процессора:"
echo "1) performance (максимальная производительность)"
echo "2) powersave (экономия энергии)"
echo "3) current (показать текущий режим)"
echo ""
echo -n "Введи номер (1-3): "

read choice

case "$choice" in
    1)
        echo "Переключаю на performance..."
        for cpu in /sys/devices/system/cpu/cpu[0-9]*/cpufreq/scaling_governor; do
            echo "performance" | sudo tee "$cpu" > /dev/null
        done
        echo "performance" > "$HOME/.cache/waybar-cpu-mode"
        ;;
    2)
        echo "Переключаю на powersave..."
        for cpu in /sys/devices/system/cpu/cpu[0-9]*/cpufreq/scaling_governor; do
            echo "powersave" | sudo tee "$cpu" > /dev/null
        done
        echo "powersave" > "$HOME/.cache/waybar-cpu-mode"
        ;;
    3)
        echo "Текущий режим:"
        cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
        ;;
    *)
        echo "Неверный выбор."
        ;;
esac

echo ""
echo "Нажми Enter для выхода..."
read