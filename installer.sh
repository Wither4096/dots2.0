#!/bin/bash

#This script installs the dotfiles inclueded in the folder

RUNDIR=$(dirname $0)

sudo pacman -S fish xorg xorg-xinit i3-wm kitty polkit polkit-gnome numlockx feh rofi polybar zip unzip intel-ucode pipewire-pulse pamixer nvidia-open nvidia-utils nvidia-settings fastfetch figlet lolcat thunar tumbler ffmpegthumbnailer ntfs-3g picom ttf-font-awesome ttf-jetbrains-mono noto-fonts-cjk noto-fonts-emoji noto-fonts btop discord mpv i2c-tools openrgb exfat-utils udiskie keepassxc newsboat imagemagick dunst xclip mpc ncmpcpp mpd playerctl spotify-launcher firefox #krita texlive qutebrowser vlc jdk-openjdk jre-openjdk code gtk-engine-murrine lxappearance easyeffects lsp-plugins xournalpp zathura zathura-pdf-mupdf ttf-dejavu sassc 

#sudo pacman -S v4l2loopback-dkms v4l2loopback-utils linux-headers obs-studio

cp -r $RUNDIR/.wallpapers $HOME

echo "i2c-dev" |sudo tee /etc/modules-load.d/i2c-dev.conf #Allows i2c-dev to start automatically at boot 

mkdir -p $HOME/Pictures/Screenshots/

cp -r $RUNDIR/.config $HOME

sudo mv $RUNDIR/.themes/* /usr/share/themes

sudo mv $RUNDIR/.icons/* /usr/share/icons

cp $RUNDIR/.gtkrc-2.0 $HOME

cp $RUNDIR/.xinitrc $HOME

cp $RUNDIR/.fehbg $HOME

cp $RUNDIR/.bashrc $HOME

cp $RUNDIR/.Xresources $HOME

cp $RUNDIR/.local/bin $HOME/.local

git clone https://aur.archlinux.org/yay.git

cd yay

makepkg -si

#yay -S librewolf-bin vscodium-bin openrgb-bin rofi-greenclip betterlockscreen ani-cli spotify mpd-notification ani-cli vscodium-bin

yay -S rofi-greenclip betterlockscreen mpd-mpris-bin python-yams yt-dlp feishin-bin

sudo cp -r $RUNDIR/X11 /etc/

cp /etc/default/grub ~/

printf "GRUB_GFXMODE=1360x768\nGRUB_BACKGROUND="/home/wither/.wallpapers/grubbg.png"" |sudo tee -a /etc/default/grub

sudo grub-mkconfig -o /boot/grub/grub.cfg
