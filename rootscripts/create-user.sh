#!/bin/bash

echo "Creating primary user..."

read -p "Enter a username: " _USERNAME
echo "$_USERNAME ALL=(ALL) ALL" > /etc/sudoers.d/$_USERNAME

useradd -mg users -G games,uucp,systemd-journal,wheel $_USERNAME
passwd $_USERNAME
