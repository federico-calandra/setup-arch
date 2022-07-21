# Pacchetti di base
pacstrap /mnt linux linux-firmware amd-ucode base base-devel grub sudo zsh
pacstrap  /mnt efibootmgr

# Tools essenziali
pacstrap /mnt cpupower thermald turbostat
pacstrap /mnt ntfs-3g usbutils nano wget android-udev os-prober git

# Networking
pacstrap /mnt inetutils openssh x11vnc networkmanager nm-connection-editor network-manager-applet

# Desktop
pacstrap /mnt xorg xorg-xinit openbox tint2 gmrun rxvt-unicode redshift
# pacstrap /mnt thunar thunar-volman thunar-media-tags-plugin

# Grub
mount /dev/sda1 /mnt
os-prober
# per GPT/UEFI, ma e' da verificare con la wiki
#grub-install --efi-directory=/mnt; grub-mkconfig -o /boot/grub/grub.cfg
grub-install --target=i386-pc /dev/sda
echo 'GRUB_DISABLE_OS_PROBER=false' >> /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

# Servizi
systemctl enable cpupower
systemctl enable thermald
systemctl enable sshd

# Git
git config --global user.name "federico"
git config --global user.email "federico.calandra@ymail.com"

# Gestione energetica
nano /etc/systemd/logind.conf; wait

# Configura spazio utente
cp ../profile /home/; mv /home/xinitrc /home/.profile
cp ../bashrc /home/; mv /home/bashrc /home/.bashrc
cp ../xinitrc /home/;mv /home/xinitrc /home/.xinitrc
cp xresources /home/; mv /home/rexresources /home/.xresources
nano /home/.xinitrc; wait
mkdir ~/.config/openbox; cp autostart ~/.config/openbox/autostart
chown f /home /mnt /opt -R
