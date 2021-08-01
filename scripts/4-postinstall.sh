#! /bin/bash

##
## ESEGUIRE NEL SISTEMA INSTALLATO
##

pacman -Sy

read -p "installa pacaur"
pacman -S expac jq
wget https://aur.archlinux.org/cgit/aur.git/snapshot/auracle-git.tar.gz; tar -xf auracle-git.tar.gz
cd auracle-git; makepkg; makepkg --install
cd ..; rm -r auracle-git
wget https://aur.archlinux.org/cgit/aur.git/snapshot/pacaur.tar.gz; tar -xf pacaur.tar.gz
cd pacaur; makepkg; makepkg --install
wait



read -p "audio"
pacman -S pulseaudio pulseaudio-alsa pasystray

read -p "installa accessori"
pacman -S galculator engrampa leafpad geeqie vlc gparted htop firefox thunderbird redshift transmission qpdfview

read -p "predisponi servizio di stampa"
pacman -S cups cups-pdf
nano /etc/cups/cups-pdf.config
systemctl enable cups.socket

read -p "installa libreoffice"
pacman -S libreoffice-fresh hunspell hunspell-it hyphen libmythes mythes-it

(pdf-studio)
(cpupower-gui)

read -p "copia segnalibri thunar"
mkdir ~/.config/gtk-3.0/ && cp bookmarks ~/.config/gtk-3.0/bookmarks
