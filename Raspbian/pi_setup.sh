#!/bin/bash

echo "Running the initial setup for Raspbian..."
#sudo apt-get -y update
#sudo apt-get -y dist-upgrade

#get software
while read sw
do
    sudo apt-get -y install $sw
done < software.txt

#configure python3
while read pkg
do
    echo y | sudo pip3 install -U $pkg
done < python3_packages.txt

sudo apt-get autoremove