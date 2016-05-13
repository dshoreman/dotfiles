#!/bin/bash

echo "Setting system hostname..."

# Set hostname
read -p "Enter hostname: " _HOSTNAME
echo "$_HOSTNAME" > /etc/hostname
sed -ie 's/localhost$/localhost\t'$_HOSTNAME'/g' /etc/hosts

# Enable DHCP
echo "Enabling DHCP..."
systemctl service enable dhcpcd@enp2s0.service
