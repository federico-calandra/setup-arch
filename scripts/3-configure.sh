#! /bin /bash

##
## ESEGUIRE NEL SISTEMA INSTALLATO
##

read -p 'Abilita servizi'
systemctl enable cpupower
systemctl enable thermald
systemctl enable sshd

read -p 'Configura networking'
## Questo e' per l'installazione minimal che si basa su networkd
#cp 20-wired.network /etc/systemd/network/
#systemctl enable systemd-network-d
systemctl enable NetworkManager

read -p 'Configura ssh'
cp ssh_config sshd_config /etc/ssh/

read -p 'Configura vnc'
x11vnc -storepasswd

read -p 'Gestione energetica'
nano /etc/systemd/logind.conf; wait

read -p 'Crea utente'
useradd -d /home -s /bin/bash f
passwd f; wait

read -p 'Sudoers'
cp ../sudoers /etc/sudoers; nano /etc/sudoers; wait; chmod 400 /etc/sudoers

read -p "Configura spazio utente"
cp ../profile /home/
cp ../bashrc /home/
cp ../xinitrc /home/
#cp xresources /home
nano ~/.xinitrc; wait
# mkdir ~/.config/openbox; cp autostart ~/.config/openbox/autostart
chown f /home /mnt /opt -R

read -p 'Reboot'
#reboot

