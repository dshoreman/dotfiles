#!/usr/bin/env bash

echo; echo "Installing packages from the AUR..."
"$DOTFILES_PATH"/stowable/scripts/pkgstrap --aur

echo; echo "Stowing configs from dotfiles..."
"$DOTFILES_PATH"/stowable/scripts/dotfiles

echo; echo -n "Adding web2mpv handler..."
mimelist="$HOME/.config/mimeapps.list"
if [ -f "${mimelist}" ] && grep -q web2mpv "${mimelist}" 2>/dev/null; then echo " [SKIP]"; else
    echo "x-scheme-handler/mpv=web2mpv.desktop;" >> "${mimelist}" && echo " [DONE]"
fi
