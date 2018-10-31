#!/bin/bash
cd ~/clevis/clevis-8
autoreconf -si
./configure --prefix=/usr --with-initramfstoolsmodulesdir=/usr/share/initramfs-tools/ 
sudo make clean
sudo make install
sudo update-initramfs -u -k 'all'
sudo update-grub
