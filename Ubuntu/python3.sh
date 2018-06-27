#!/bin/bash

clear

echo "Now installing Python modules..."

#need pip first
yes | sudo apt-get pip
yes | sudo apt-get pip3

#modules using pip
yes | sudo -H pip3 install numpy --upgrade
yes | sudo -H pip3 install scipy --upgrade
yes | sudo -H pip3 install matplotlib --upgrade
yes | sudo -H pip3 install pandas --upgrade
yes | sudo -H pip3 install h5py --upgrade
yes | sudo -H pip3 install sklearn --upgrade
yes | sudo -H pip3 install seaborne --upgrade
yes | sudo -H pip3 install mysqlconnector --upgrade
yes | sudo -H pip3 install pygame --upgrade
yes | sudo -H pip3 install sqlalchemy --upgrade
yes | sudo -H pip3 install selenium --upgrade

#modules using apt
yes | sudo add-apt-repository ppa:kivy-team/kivy
yes | sudo apt-get install python3-kivy

#build tensorflow from source...
sudo bash tensorflow.sh

#module that needs tensorflow
yes | sudo -H pip3 install keras --upgrade

#sublime text for an IDE
sudo bash sublime.sh
