#!/usr/bin/env bash

echo; echo "Installing packages from the AUR..."
"$DOTFILES_PATH/stowable/bin/pkgstrap" --aur && \
    # mpv-mpris must be last or it installs mpv,
    # which then conflicts with mpv-vapoursynth.
    sudo pacman -S --no-confirm --needed mpv-mpris

echo; echo "Creating XDG directories..."
mkdir -p ~/.local/share/xdg/{desktop,public,templates}
mkdir -p ~/{docs,dl,music,pictures,videos}

echo; echo "Stowing configs from dotfiles..."
"$DOTFILES_PATH"/stowable/bin/dotfiles

echo; echo -n "Adding web2mpv handler..."
mimelist="$HOME/.config/mimeapps.list"
if [ -f "${mimelist}" ] && grep -q web2mpv "${mimelist}" 2>/dev/null; then echo " [SKIP]"; else
    echo "x-scheme-handler/mpv=web2mpv.desktop;" >> "${mimelist}" && echo " [DONE]"
fi
