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
echo y | pacman -S tensorflow
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

ARCHGIT="https://aur.archlinux.org"

#keras
PY="python-keras"
if [ ! -d "$HDIR/$PY" ]; then
	git clone $ARCHGIT/$PY.git $HDIR/$PY
fi
cd $HDIR/$PY
git pull
grep "depends=('python'" PKGBUILD | grep -o "'[a-zA-Z0-9\-]*'" | grep -o "[a-zA-Z0-9\-]*" > dependencies.txt
while read p; do
	echo y | pacman -S $p
done < dependencies.txt
sudo -u nobody makepkg -si


#pygame
PY="python-pygame"
if [ ! -d "$HDIR/$PY" ]; then
	git clone $ARCHGIT/$PY.git $HDIR/$PY
fi
cd $HDIR/$PY
git pull
grep "depends=('python'" PKGBUILD | grep -o "'[a-zA-Z0-9\-]*'" | grep -o "[a-zA-Z0-9\-]*" > dependencies.txt
while read p; do
	echo y | pacman -S $p
done < dependencies.txt
sudo -u nobody makepkg -si

