#!/bin/bash

clear

echo "Now installing Python modules..."

#need pip first (the GOOD one NOT from apt-get)
yes | sudo apt-get install curl
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python3 get-pip.py #NOTE: pip3 is aliased as pip from here on

#modules using pip
yes | sudo -H pip install cython --upgrade
yes | sudo -H pip install numpy --upgrade
yes | sudo -H pip install scipy --upgrade
yes | sudo -H pip install matplotlib --upgrade
yes | sudo -H pip install pandas --upgrade
yes | sudo -H pip install h5py --upgrade
yes | sudo -H pip install sklearn --upgrade
yes | sudo -H pip install seaborne --upgrade
yes | sudo -H pip install mysqlconnector --upgrade
yes | sudo -H pip install pygame --upgrade
yes | sudo -H pip install sqlalchemy --upgrade
yes | sudo -H pip install selenium --upgrade
yes | sudo -H pip install django --upgrade
yes | sudo -H pip install flask --upgrade

#kivy is special...
yes | sudo add-apt-repository ppa:kivy-team/kivy
yes | sudo -H apt-get install python3-kivy

#build tensorflow from source...
sudo bash tensorflow.sh

#module that needs tensorflow
yes | sudo -H pip install keras --upgrade

#sublime text for an IDE
sudo bash sublime.sh

