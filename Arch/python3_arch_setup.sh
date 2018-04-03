#!/bin/bash

#assumes root
#clear console
clear

#get python
echo y | pacman -S python3
echo y | pacman -S tk #for IDLE

#get packages that are available via pacman
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


