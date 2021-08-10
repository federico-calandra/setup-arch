#! /bin/bash

##
## ESEGUIRE IN AMBIENTE LIVE
##

# L'hard disk deve essere stato partizionato. La partizione formattata in ext4 e montata in /mnt
# mount /dev/sdXy /mnt; mkswap /dev/swap_part; swapon /dev/swap_part; mkfs.ext4 /dev/sdXy

read -p "imposta ororlogio"
timedatectl set-timezone Europe/Rome; timedatectl set-ntp true

read -p "installa pacchetti di base"
pacstrap /mnt linux linux-firmware amd-ucode base base-devel grub sudo zsh
pacstrap  /mnt efibootmgr

read -p "installa pacchetti di tools essenziali"
pacstrap /mnt cpupower thermald turbostat
pacstrap /mnt ntfs-3g usbutils nano wget android-udev os-prober git

read -p "installa pacchetti networking"
pacstrap /mnt inetutils openssh x11vnc networkmanager nm-connection-editor network-manager-applet

read -p "installa pacchetti desktop"
pacstrap /mnt xorg xorg-xinit openbox tint2 gmrun rxvt-unicode redshift
# pacstrap /mnt thunar thunar-volman thunar-media-tags-plugin

read -p "genera fstab"
genfstab -U /mnt >> /mnt/etc/fstab
nano /mnt/etc/fstab; wait

read -p "genera locale"
nano /etc/locale.gen; wait; locale-gen
touch /mnt/etc/locale.conf /mnt/etc/vconsole.conf
echo LANG=it_IT.UTF-8 >> /mnt/etc/locale.conf
echo KEYMAP=it >> /mnt/etc/vconsole.conf

read -p 'entra chroot'
arch-chroot /mnt; wait

read -p 'reboot'
reboot
