#!/bin/bash

echo Installing pacman packages
sudo pacman -S --needed --noconfirm git kitty firefox wofi obs-studio fish rofi steam nwg-look nvim fastfetch spotify-launcher pavucontrol btop cava swww telegram-desktop openrgb nautilus wine hyprshot hyprpicker


echo Installing yay
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si 
cd .. && rm -rf yay


echo Installing yay packages
yay -S --needed --noconfirm vesktop nekoray waypaper waybar-cava visual-studio-code-bin


echo Installing fonts
sudo pacman -S --needed --noconfirm noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-dejavu ttf-liberation ttf-droid ttf-jetbrains-mono ttf-jetbrains-mono-nerd ttf-font-awesome


echo Copying configs
mkdir -p ~/.config ~/.themes ~/.icons ~/.Wallpapers

cp -rn .themes/* ~/.themes/
cp -rn .icons/* ~/.icons/
cp -rn .config/* ~/.config/
cp -rn .Wallpapers/* ~/.Wallpapers/


echo Changing shell to fish
chsh -s /usr/bin/fish

set -U fish_color_cwd 57A3C9
set -U fish_color_user 57A3C9

echo Installing a VSCode Theme
code --install-extension enkia.tokyo-night

echo \nTo complete the installation, reboot your system

