#!/bin/bash

clear

echo "Now configuring Java..."

#install java 8 & 9
yes | sudo apt-get install openjdk-8-jre-headless
yes | sudo apt-get install openjdk-9-jre-headless

echo "Java is now installed!"


