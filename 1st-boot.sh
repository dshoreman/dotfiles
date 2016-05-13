#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "!!! This script must be run as root! Aborting."
    exit 1
fi

echo "####################"
echo "# HERE BY DRAGONS! #"
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
