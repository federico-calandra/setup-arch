#! /bin/bash

##
##ESEGUI IN AMBIENTE CHROOT
##

read -p 'imposta orologio'
ln -sf /usr/share/zoneinfo/Europe/Rome
hwclock --systohc

read -p 'genera hostname e hosts'
touch /etc/hostname /etc/hosts
nano /etc/hostname; wait
nano /etc/hosts; wait

read -p 'password root'
passwd; wait

read -p 'grub'
mount /dev/sda2 /mnt
os-prober
grub-install /dev/sda; grub-mkconfig -o /boot/grub/grub.cfg

read -p 'esci chroot'
exit
