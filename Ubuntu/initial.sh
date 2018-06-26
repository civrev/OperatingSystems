#!/bin/bash
#This is the script I would run after a fresh install of Ubuntu

#update
yes | sudo apt-get update
yes | sudo apt-get upgrade


#configure Python3
sudo bash python3.sh

#configure java
sudo bash java.sh

#get rid of unneeded things
yes | sudo apt autoremove

#done
clear
echo "Done! Ubuntu is now ready."

echo "You'll still need to:\nInstall Eclipse\nDownload Selenium WebDriver jars\nDownload GeckoDriver"
