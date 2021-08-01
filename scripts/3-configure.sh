#! /bin /bash

##
## ESEGUIRE NEL SISTEMA INSTALLATO
##

read -p 'abilita servizi'
systemctl enable cpupower
systemctl enable thermald
systemctl enable sshd

read -p 'configura networking'
read -p 'configura ssh'

## Questo e' per l'installazione minimal che si basa su networkd
#cp 20-wired.network /etc/systemd/network/
#systemctl enable systemd-network-d

systemctl enable networkmanager
cp ssh_config sshd_config /etc/ssh/
read -p 'configura vnc'
x11vnc -storepasswd


read -p 'gestione energetica'
nano /etc/systemd/logind.conf; wait

read -p 'crea utente'
useradd -d /home -s /bin/bash f
passwd f; wait

read -p 'sudoers'
cp sudoers /etc/sudoers; nano /etc/sudoers; wait; chmod 400 /etc/sudoers

read -p "configura spazio utente"
cp profile ~/.profile
cp bashrc ~/.bashrc
cp xinitrc ~/.xinitrc
cp xresources ~/.xresources
nano ~/.xinitrc; wait
mkdir ~/.config/openbox; cp autostart ~/.config/openbox/autostart
chown f /dati /home /mnt /opt -R

read -p 'reboot'
#reboot

