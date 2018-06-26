#!/bin/bash

::<< 'END'
Steps for partitioning, and begining setup
===Boot Arch Linux
===ping www.google.com (Ctrl-C)
===fdisk -l
===cfdisk
===dos
===Free Space
===10G
===primary
===Bootable
===Write
===Free Space
===2048M
===Primary
===Free Space
===[Defualt remaining space ~8G]
===Primary
===Write
===Quit
END

step1(){
	mkfs.ext4 /dev/sda1
	mkfs.ext4 /dev/sda3
	mkswap /dev/sda2
	swapon /dev/sda2
	mount /dev/sda1 /mnt
	mkdir /mnt/home
	mount /dev/sda3 /mnt/home
	pacstrap /mnt base-devel
	genfstab /mtn>> /mnt/etc/fstab
	arch-chroot /mnt /bin/bash
	#[create root user]
	nano /etc/local.gen
	#[uncomment en_US.UTF-8 UTF-8, then save Ctrl-S, exit Ctrl-X]
}

step2(){
	locale-gen
	echo "LANG=en_US.UTF-8" >> /etc/locale.conf 
	ln –s /usr/share/zoneinfo/America/New_York /etc/localtime
	hwclock --systohc --utc
	clear
	echo "set password"
	passwd
	#[set password]
}

step3(){
	pacman –S grub os-prober
	grub-install /dev/sda
	grub-mkconfig –o /boot/grub/grub.cfg
	exit
	reboot
}

if [ "$1" = "1"]; then
	step1()
fi

if [ "$1" = "2"]; then
	step2()
fi

if [ "$1" = "3"]; then
	step3()
fi





