#!/bin/bash

# Preq. apt-get install dracut
sudo apt-get install -y quilt
sudo apt-get -y install debhelper libaudit-dev libglib2.0-dev libjose-dev libluksmeta-dev libssl-dev libudisks2-dev tang 

mkdir -p ~/clevis
cd ~/clevis
apt-get source clevis
cd ~/clevis/clevis-8

mkdir -p ~/test
cd ~/test
cp ~/clevis.tar .
tar -xvf clevis.tar

cd ~/clevis/clevis-8
mkdir -p src/initramfs-tools/
mkdir -p src/initramfs-tools/scripts/local-bottom/
mkdir -p src/initramfs-tools/scripts/local-top/
mkdir -p src/initramfs-tools/hooks/

quilt pop -a
quilt push -a
quilt new add_ubuntu_support.patch
quilt add Makefile.am
#quilt add README.md
quilt add configure.ac
quilt add src/Makefile.am
quilt add src/initramfs-tools/Makefile.am
quilt add src/initramfs-tools/hooks/clevis.in
quilt add src/initramfs-tools/scripts/local-bottom/clevis.in
quilt add src/initramfs-tools/scripts/local-top/clevis.in
quilt refresh

#mkdir -p src/initramfs-tools/
#mkdir -p src/initramfs-tools/scripts/local-bottom/
#mkdir -p src/initramfs-tools/scripts/local-top/
#mkdir -p src/initramfs-tools/hooks/
cp ~/test/clevis/clevis-8/Makefile.am Makefile.am
#cp ~/test/clevis/clevis-8/README.md README.md
cp ~/test/clevis/clevis-8/configure.ac configure.ac
cp ~/test/clevis/clevis-8/src/Makefile.am src/Makefile.am
cp ~/test/clevis/clevis-8/src/initramfs-tools/Makefile.am src/initramfs-tools/Makefile.am
cp ~/test/clevis/clevis-8/src/initramfs-tools/hooks/clevis.in src/initramfs-tools/hooks/clevis.in
cp ~/test/clevis/clevis-8/src/initramfs-tools/scripts/local-bottom/clevis.in src/initramfs-tools/scripts/local-bottom/clevis.in
cp ~/test/clevis/clevis-8/src/initramfs-tools/scripts/local-top/clevis.in src/initramfs-tools/scripts/local-top/clevis.in
quilt refresh

# Build the .deb packages
cd ~/clevis/clevis-8
#dpkg-buildpackage -rfakeroot -b
#sudo dpkg-buildpackage -rfakeroot -b -d

#autoreconf -si

# adding:
#debian/rules:

#dh_auto_configure -- --with-dracutmodulesdir=/usr/lib/dracut/modules.d --with-initramfstoolsmodulesdir=/usr/share/initramfs-tools

# apt-get install initrmfs-tools
# sudo dpkg-buildpackage -rfakeroot -b -d
