#!/bin/bash

#This script installs the dotfiles inclueded in the folder

RUNDIR=$(dirname $0)

sudo pacman -S fish xorg xorg-xinit i3-wm kitty polkit numlockx feh rofi polybar zip unzip intel-ucode pipewire-pulse nvidia nvidia-utils nvidia-settings neofetch figlet lolcat thunar tumbler ffmpegthumbnailer ntfs-3g picom ttf-font-awesome ttf-jetbrains-mono noto-fonts-cjk noto-fonts-emoji noto-fonts ttf-dejavu sassc btop discord mpv i2c-tools exfat-utils udiskie keepassxc newsboat zathura zathura-pdf-mupdf imagemagick dunst xclip mpc ncmpcpp mpd playerctl xournalpp spotify-launcher firefox #krita texlive qutebrowser vlc jdk-openjdk jre-openjdk code gtk-engine-murrine terminator lxappearance easyeffects lsp-plugins

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

cp $RUNDIR/vencord-settings-backup.json $HOME

cp $RUNDIR/.local/bin $HOME/.local

git clone https://aur.archlinux.org/yay.git

cd yay

makepkg -si

#yay -S librewolf-bin vscodium-bin openrgb-bin rofi-greenclip betterlockscreen ani-cli spotify mpd-notification ani-cli

yay -S vscodium-bin openrgb-bin rofi-greenclip betterlockscreen mpd-mpris-bin python-yams yt-dlp

sudo cp $RUNDIR/X11/ /etc/

cp /etc/default/grub ~/

printf "GRUB_GFXMODE=1360x768\nGRUB_BACKGROUND="/home/wither/.wallpapers/grubbg.png"" |sudo tee -a /etc/default/grub

sudo grub-mkconfig -o /boot/grub/grub.cfg
