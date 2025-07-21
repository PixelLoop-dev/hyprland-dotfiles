#!/bin/bash

echo Установка пакетов pacman:
sudo pacman -S --needed git kitty firefox wofi obs-studio fish rofi steam nwg-look nvim fastfetch spotify-launcher pavucontrol btop cava swww telegram-desktop openrgb nautilus wine visual-studio-code-bin  hyprshot hyprpicker

echo Установка yay
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si 
cd .. && rm -rf yay

echo Установка пакетов yay
yay -S vesktop nekoray waypaper waybar-cava 

echo Установка шрифтов
sudo pacman -S --needed noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-dejavu ttf-liberation ttf-droid ttf-jetbrains-mono ttf-jetbrains-mono-nerd ttf-font-awesome

echo Копирование конфигов
mkdir -p ~/.config ~/.themes ~/.icons ~/.Wallpapers

cp -rn .themes/* ~/.themes/
cp -rn .icons/* ~/.icons/
cp -rn .config/* ~/.config/
cp -rn .Wallpapers/* ~/.Wallpapers/

echo Изменение шелла на fish
chsh -s /usr/bin/fish

set -U fish_color_cwd 57A3C9
set -U fish_color_user 57A3C9


echo Установка завершена.

read -p "Перезапустить систему? (y/n): " choice
if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    echo "Перезагрузка системы..."
    sudo reboot
else
    echo "Установка завершена."
fi
