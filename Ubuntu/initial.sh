#!/bin/bash
#This is the script I would run after a fresh install of Ubuntu

#update
yes | sudo apt-get upgrade


#configure Python3
sudo bash python3.sh

#get rid of unneeded things
sudo apt autoremove

#done
clear
echo "Done! Ubuntu is now ready."
