#!/bin/bash

echo "Setting system hostname..."

# Set hostname
read -p "Enter hostname: " _HOSTNAME
echo "$_HOSTNAME" > /etc/hostname
sed -ie 's/localhost$/localhost\t'$_HOSTNAME'/g' /etc/hosts

# Get the interface name
echo
echo "We are about to print a list of network devices"
echo "present in your system. When prompted,  type in"
echo "the name of your ethernet device e.g. 'enp2s0'."
echo
ip link
echo
read -p "Enter interface name: " _INTERFACE

# Enable DHCP
echo "Enabling DHCP..."
systemctl enable dhcpcd@${_INTERFACE}.service
systemctl start dhcpcd@${_INTERFACE}.service
