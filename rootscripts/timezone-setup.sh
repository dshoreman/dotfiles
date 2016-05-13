#!/bin/bash

echo "Setting system clock and timezone..."

ln -s /usr/share/zoneinfo/Europe/London /etc/localtime
timedatectl --set-ntp true
hwclock --systohc --utc
