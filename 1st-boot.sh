#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "!!! This script must be run as root! Aborting."
    exit 1
fi

echo "####################"
echo "# HERE BE DRAGONS! #"
echo "####################"
echo
echo "This script is designed to be ran only once and that's"
echo "at the time of first boot on a new Arch Linux install."
echo
echo "If you've already ran this script previously, please"
echo "abort it now. Instead, run bootstrap.sh to continue."
echo
read -rsn1 -p $'Press any key to continue or Ctrl+C to exit.\n'

cd "${0%/*}/rootscripts"

. set-console-font.sh
. set-locale.sh
. configure-network.sh
. timezone-setup.sh
. create-user.sh
. prepare-pacman.sh

# Make the somewhat dangerous assumption that
# the user cloned this repo to ~/dotfiles...
mv /root/dotfiles /home/$_USERNAME/dotfiles
chown -R $_USERNAME:users /home/$_USERNAME/dotfiles

echo "##################"
echo "# !!! HUZZAH !!! #"
echo "##################"
echo
echo "First boot setup gubbins have finished. At last!"
echo
echo "Now, it's time we boot you back to the login screen."
echo "When you get there, log in as $_USERNAME and then we"
echo "can continue this process by running bootstrap.sh..."
echo
echo "Sound good? Good!"
echo
echo
read -rsn1 -p $'Press any key to logout.\n'

logout
