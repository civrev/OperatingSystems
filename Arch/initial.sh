#!/bin/bash

#internet
#ip link #show available connections
#dhcpcd 2 #add connection 2, if this doesnt work do same command with the actual name of the interface

#basic packages
echo y | pacman -Syu #sys update
echo y | pacman -S git #for AUR packages

#set up my python 3 environment
bash python3_arch_setup.sh
