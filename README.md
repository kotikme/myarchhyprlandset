Скрин
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/c39ab358-c8f9-4a4c-93e9-54565c919d5e" />


# 1. Убедись, что у тебя есть git
```
sudo pacman -S git
```

# 2. Клонируй репозиторий
```
git clone https://github.com/kotikme/myarchhyprlandset.git ~/dotfiles
```

# 3. Скопируй конфиги в нужные места (с заменой)
```
cp -r ~/dotfiles/.config/* ~/.config/
cp ~/dotfiles/.bashrc ~/ 2>/dev/null || true
mkdir -p ~/Pics/wallpapers
mkdir -p ~/Pics/screens
```
Не забудьте дать скриптам право на исполнение: `chmod +x ~/.config/waybar/scripts/*`
# 4. Установи необходимые пакеты
```
sudo pacman -S hyprland waybar kitty wofi hyprpaper brightnessctl networkmanager dunst hyprpolkitagent grim slurp jq fastfetch
```

# Опционально: зеркала
мой список зеркал, найши их можно по пути: /etc/pacman.d/mirrorlist
```
Server = http://ru.mirrors.cicku.me/archlinux/$repo/os/$arch
Server = https://ru.mirrors.cicku.me/archlinux/$repo/os/$arch
Server = https://archlinux.gay/archlinux/$repo/os/$arch
Server = http://archlinux.gay/archlinux/$repo/os/$arch
Server = https://mirror.yandex.ru/archlinux/$repo/os/$arch
Server = http://mirror.yandex.ru/archlinux/$repo/os/$arch
Server = https://repository.su/archlinux/$repo/os/$arch
Server = http://repository.su/archlinux/$repo/os/$arch
Server = https://mirror.cachy-arch.ru/archlinux/$repo/os/$arch
Server = https://mirror.kpfu.ru/archlinux/$repo/os/$arch
Server = http://mirror.cachy-arch.ru/archlinux/$repo/os/$arch
Server = http://mirrors.powernet.com.ru/archlinux/$repo/os/$arch
Server = http://mirror.kpfu.ru/archlinux/$repo/os/$arch
Server = https://mirror.nw-sys.ru/archlinux/$repo/os/$arch
Server = http://mirror.nw-sys.ru/archlinux/$repo/os/$arch
Server = https://vlst.su/archlinux/$repo/os/$arch
Server = http://vlst.su/archlinux/$repo/os/$arch
Server = http://wan.metrosg.ru/archlinux/$repo/os/$arch
Server = https://wan.metrosg.ru/archlinux/$repo/os/$arch
Server = https://geo.mirror.pkgbuild.com/$repo/os/$arch
Server = https://mirror.rackspace.com/archlinux/$repo/os/$arch
Server = https://ftp.halifax.rwth-aachen.de/archlinux/$repo/os/$arch
Server = https://mirrors.kernel.org/archlinux/$repo/os/$arch
```
# 6. Перезагрузи Hyprland или перезагрузись
```
hyprctl reload
```
# или
```
reboot
```
