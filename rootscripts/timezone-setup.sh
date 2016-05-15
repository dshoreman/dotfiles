#!/bin/bash

echo "Setting system clock and timezone..."

ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
timedatectl --set-ntp true
hwclock --systohc --utc
