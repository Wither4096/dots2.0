#!/bin/bash

sudo pacman -S os-prober fish sway swaybg rofi-wayland waybar kitty polkit polkit-gnome feh zip unzip amd-ucode pipewire-pulse mesa fastfetch thunar tumbler ffmpegthumbnailer xdg-user-dirs ntfs-3g ttf-nerd-fonts-symbols ttf-jetbrains-mono noto-fonts-cjk noto-fonts-emoji noto-fonts btop discord mpv exfat-utils udiskie keepassxc imagemagick dunst playerctl firefox spotify-launcher 

sudo cp /etc/default/grub /etc/default/grub.old
sudo mv dracula /boot/grub/themes

cp -r laptopconf/ $HOME/.config
mv .wallpapers $HOME/.config/
mv .local/bin $HOME/.local/bin/
sudo mv .themes/* /usr/share/themes
sudo mv .icons/* /usr/share/icons
cp .gtkrc-2.0 $HOME
cp laptopconf/.bashrc $HOME
cp .Xresources $HOME
mv .vim/ $HOME
cp .vimrc $HOME

sudo cp 99-noto-reject-nastaliq.conf /etc/fonts/conf.d/

# curl -LO https://github.com/werman/noise-suppression-for-voice/releases/latest/download/linux-rnnoise.zip
# mkdir -p ~/.local/share/noise-suppression
# unzip linux-rnnoise.zip -d ~/.local/share/noise-suppression

systemctl --user enable --now pipewire.service

git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si

printf "GRUB_GFXMODE=1920x1080\nGRUB_DISABLE_OS_PROBER=false\nGRUB_THEME="/boot/grub/themes/dracula/theme.txt""|sudo tee -a /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg