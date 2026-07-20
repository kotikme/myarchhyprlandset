Скрин
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/b35f2ee9-5ed8-4d68-aefc-005aa0383b12" />

# 1. Убедись, что у тебя есть git
sudo pacman -S git

# 2. Клонируй репозиторий
git clone https://github.com/kotikme/myarchhyprlandset.git ~/dotfiles

# 3. Скопируй конфиги в нужные места (с заменой)
cp -r ~/dotfiles/.config/* ~/.config/
cp ~/dotfiles/.bashrc ~/ 2>/dev/null || true

# 4. Установи необходимые пакеты
sudo pacman -S hyprland waybar kitty wofi hyprpaper brightnessctl networkmanager dunst hyprpolkitagent grim slurp jq fastfetch

# 6. Перезагрузи Hyprland или перезагрузись
hyprctl reload
# или
reboot
