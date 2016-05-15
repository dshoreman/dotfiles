#!/bin/sh

_GHMAIL="$(whoami)@users.noreply.github.com"

echo
echo "Almost done! Now for some last few finishing touches..."
echo
echo "First off, let's get Git configured."

while [ -z "$_FULLNAME" ]; do
    read -p "Enter your name: "  _FULLNAME
done

read -p "Enter your email [$_GHMAIL]: " _TMPMAIL

[ -n "$_TMPMAIL" ] && _GHMAIL="$_TMPMAIL"

echo -n "Setting Git name and email..."
git config --global user.name "$_FULLNAME"
git config --global user.email "$_GHMAIL"
echo " [DONE]"

echo -n "Installing rhythmbox-chromecast..."
wget -O - https://git.io/vwzUw | bash
echo " [DONE]"

echo -n "Cleaning up packages..."
sudo pacman -Rsn nano vi jfsutils reiserfsprogs xfsprogs pcmciautils
echo " [DONE]"
