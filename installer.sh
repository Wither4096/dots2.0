#!/bin/bash

#This script installs the dotfiles inclueded in the folder

RUNDIR=$(dirname $0)

sudo pacman -S os-prober fish xorg xorg-xinit i3-wm kitty polkit polkit-gnome feh rofi polybar zip unzip intel-ucode pipewire-pulse pamixer nvidia-open nvidia-utils fastfetch thunar tumbler ffmpegthumbnailer ntfs-3g picom ttf-nerd-fonts-symbols ttf-jetbrains-mono noto-fonts-cjk noto-fonts-emoji noto-fonts btop discord mpv exfat-utils udiskie keepassxc imagemagick dunst xclip playerctl spotify-launcher firefox #krita texlive qutebrowser vlc jdk-openjdk jre-openjdk code gtk-engine-murrine lxappearance easyeffects lsp-plugins xournalpp zathura zathura-pdf-mupdf ttf-dejavu sassc nvidia-settings lolcat figlet v4l2loopback-dkms v4l2loopback-utils linux-headers obs-studio ttf-font-awesome numlockx i2c-tools openrgb newsboat mpc ncmpcpp mpd 

cp -r $RUNDIR/.wallpapers $HOME

echo "i2c-dev" |sudo tee /etc/modules-load.d/i2c-dev.conf #Allows i2c-dev to start automatically at boot 

mkdir -p $HOME/Pictures/Screenshots/

cp -r $RUNDIR/.config $HOME

mkdir $HOME/.config/mpd/playlists

sudo mv $RUNDIR/.themes/* /usr/share/themes

sudo mv $RUNDIR/.icons/* /usr/share/icons

cp $RUNDIR/.gtkrc-2.0 $HOME

cp $RUNDIR/.xinitrc $HOME

cp $RUNDIR/.fehbg $HOME

cp $RUNDIR/.bashrc $HOME

cp $RUNDIR/.Xresources $HOME

cp -r $RUNDIR/.local/bin $HOME/.local/bin

cp $RUNDIR/.vimrc $HOME

cp -r $RUNDIR/.vim $HOME

sudo cp $RUNDIR/99-noto-reject-nastaliq.conf /etc/fonts/conf.d/99-noto-reject-nastaliq.conf

curl -LO https://github.com/werman/noise-suppression-for-voice/releases/latest/download/linux-rnnoise.zip

mkdir -p ~/.local/share/noise-suppression

unzip linux-rnnoise.zip -d ~/.local/share/noise-suppression

systemctl --user enable --now pipewire.service

git clone https://aur.archlinux.org/yay-bin.git

cd yay-bin

makepkg -si

#yay -S librewolf-bin vscodium-bin openrgb-bin rofi-greenclip betterlockscreen ani-cli spotify mpd-notification ani-cli vscodium-bin betterlockscreen python-yams yt-dlp

yay -S rofi-greenclip mpd-mpris-bin feishin-bin

#sudo mv -r $RUNDIR/X11 /etc/

sudo cp $RUNDIR/X11/xorg.conf.i /etc/X11/

sudo cp $RUNDIR/X11/xorg.conf.n /etc/X11/

sudo cp $RUNDIR/X11/xorg.conf.d/50-mouse-acceleration.conf /etc/X11/xorg.conf.d

cp /etc/default/grub /etc/default/grub.old

sudo cp -r $RUNDIR/dracula /boot/grub/themes/dracula

#printf "GRUB_GFXMODE=1360x768\nGRUB_BACKGROUND="/home/wither/.wallpapers/grubbg.png"" |sudo tee -a /etc/default/grub
printf "GRUB_GFXMODE=1360x768\nGRUB_DISABLE_OS_PROBER=false\nGRUB_THEME="/boot/grub/themes/dracula/theme.txt""|sudo tee -a /etc/default/grub

sudo grub-mkconfig -o /boot/grub/grub.cfg
