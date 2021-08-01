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
cp 20-wired.network /etc/systemd/network/
cp ssh_config sshd_config /etc/ssh/
systemctl enable systemd-network-d
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

