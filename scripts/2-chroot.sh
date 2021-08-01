#! /bin/bash

##
##ESEGUI IN AMBIENTE CHROOT
##

## In UEFI bisogna montare la partizione EFI su /mnt

read -p 'imposta orologio'
ln -sf /usr/share/zoneinfo/Europe/Rome
hwclock --systohc

read -p 'genera hostname e hosts'
touch /etc/hostname; nano /etc/hostname; wait
cp ../hosts /etc/hosts; nano /etc/hosts; wait

read -p 'password root'
passwd; wait

read -p 'grub'
mount /dev/sda1 /mnt
os-prober
grub-install --efi-directory=/mnt; grub-mkconfig -o /boot/grub/grub.cfg

read -p 'esci chroot'
exit
