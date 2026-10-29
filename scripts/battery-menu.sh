#!/bin/bash

echo "Выбери режим питания:"
echo "1) performance (макс. производительность, больше тепла) - временно не работает"
echo "2) balanced (сбалансированный)"
echo "3) powersave (экономия батареи, медленнее)"
echo "4) current (показать текущий)"
echo ""
echo -n "Введи номер (1-4): "

read choice

case "$choice" in
    1)
        echo "Переключаю на performance..."
        tuned-adm profile performance
        ;;
    2)
        echo "Переключаю на balanced..."
        tuned-adm profile balanced
        ;;
    3)
        echo "Переключаю на powersave..."
        tuned-adm profile powersave
        ;;
    4)
        echo "Текущий режим:"
        tuned-adm active
        ;;
    *)
        echo "Неверный выбор."
        ;;
esac

echo ""
echo "Нажми Enter для выхода..."
read