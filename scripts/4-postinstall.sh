#! /bin/bash

##
## ESEGUIRE NEL SISTEMA INSTALLATO
##

pacman -Sy

read -p "installa pacaur"
#pacman -S expac jq
#wget https://aur.archlinux.org/cgit/aur.git/snapshot/auracle-git.tar.gz; tar -xf auracle-git.tar.gz
#cd auracle-git; makepkg; makepkg --install
#cd ..; rm -r auracle-git
#wget https://aur.archlinux.org/cgit/aur.git/snapshot/pacaur.tar.gz; tar -xf pacaur.tar.gz
#cd pacaur; makepkg; makepkg --install
wait



read -p "Audio"
pacman -S pulseaudio pulseaudio-alsa pasystray

read -p "Installa sys apps"
pacman -S htop  gparted cups cups-pdf

read -p "Installa accessori"
pacman -S leafpad geequie engrampa geeqie vlc redshift firefox thunderbird transmission-qt qpdfview

read -p "Servizio printer"
#nano /etc/cups/cups-pdf.config
#systemctl enable cups.socket

read -p "Installa LibreOffice"
pacman -S libreoffice-fresh hunspell hunspell-it hyphen libmythes mythes-it

#pdf-studio
#cpupower-gui

read -p "copia segnalibri thunar"
#mkdir ~/.config/gtk-3.0/ && cp bookmarks ~/.config/gtk-3.0/bookmarks
