#!/bin/bash

echo "Configuring pacman..."

# Enable colour and Pac-Man easter egg
sed -ie 's/^#Color/Color\nILoveCandy/' /etc/pacman.conf

# Base download stats on all packages, not just current download
sed -ie 's/^#TotalDownload/TotalDownload/' /etc/pacman.conf

# Enable multilib
sed -ie '/^#\[multilib]$/{N;s/#\[multilib]\n#/[multilib]\n/}' /etc/pacman.conf

# Install reflector for mirror prioritisation
pacman -Syy && pacman -S reflector
reflector --save /etc/pacman.d/mirrorlist --sort rate -c "United Kingdom"

# One last mirror update
pacman -Syy
