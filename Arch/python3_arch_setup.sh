#!/bin/bash

#assumes root
#clear console
clear

echo "Getting pacman packages..."

: <<'END'

#get python
echo y | pacman -S python
#echo y | pacman -S tk #don't try these without a GUI
#echo y | pacman -S python-tk #for IDLE

#get packages that are available via pacman
echo y | pacman -S python-cython
echo y | pacman -S python-numpy
echo y | pacman -S python-scipy
printf '1\ny' | pacman -S python-matplotlib #has 2 user inputs
echo y | pacman -S python-pandas
echo y | pacman -S python-mysql-connector
echo y | pacman -S python-sqlalchemy
echo y | pacman -S python-statsmodels
echo y | pacman -S python-seaborn
echo y | pacman -S python-scikit-learn
echo y | pacman -S python-tensorflow
echo y | pacman -S python-h5py

END

clear

echo "Now Building AUR packages..."

#Arch PKGBUILDs are community maintained
#so priviledges magic will have to be performed to reduce permissions

ADIR="$PWD"
HDIR="/home/build"
mkdir $HDIR
chgrp nobody $HDIR
chmod g+ws $HDIR
setfacl -m u::rwx,g::rwx $HDIR
setfacl -d --set u::rwx,g::rwx,o::- $HDIR

#will avoid re-cloning git repositories
#and will only call git pull

#NOTE: This will never be true running this for the first time
#cloned repositories will never be in THIS repository
#and are handled by the gitignore

#keras
if [ ! -d "$HDIR/python-keras" ]; then
	git clone https://aur.archlinux.org/python-keras.git $HDIR
fi
cd $HDIR/python-keras
git pull
sudo -u nobody makepkg -si

#pygame
if [ ! -d "$HDIR/python-pygame" ]; then
	git clone https://aur.archlinux.org/python-pygame.git $HDIR
fi
cd $HDIR/python-pygame
git pull
sudo -u nobody makepkg -si

