#!/bin/bash

# Do not run as root!
if [ "$EUID" -eq 0 ]; then
    echo "!!! This script must not be run as root! Aborting."
    exit 1
fi

# Grab Dave Reisner's key. He maintains expac, pacman, curl...
# Tl;dr: We're a bit fucked without it.
gpg --recv-keys --keyserver hkp://pgp.mit.edu 1EB2638FF56C0C53

if hash cower 2>/dev/null; then
    echo "Skipping cower installation. Already installed."
else
    # Install cower as a dependency
    git clone https://aur.archlinux.org/cower.git && cd cower
    makepkg -sri --noconfirm --asdeps && cd ..
fi

if hash pacaur 2>/dev/null; then
    echo "Skipping pacaur installation. Already installed."
else
    # Finally, install pacaur
    git clone https://aur.archlinux.org/pacaur.git && cd pacaur
    makepkg -sri --noconfirm && cd ..
fi
