#!/bin/sh

if [ -f "$BOOTSTRAP_ROOT/.installed.post" ]; then
    return
fi

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

if [ "$OS" == "arch" ]; then
    echo -n "Installing rhythmbox-chromecast..."
    wget -O - https://git.io/vwzUw | bash
    echo " [DONE]"

    if [ ! -f /etc/udev/rules.d/60-vboxdrv.rules ]; then
        echo -n "Applying Virtualbox USB patch..."
        sudo cp "$BOOTSTRAP_ROOT/patches/vbox-usb.patch" /etc/udev/rules.d/60-vboxdrv.rules

        if [[ ! $(id -Gn $(whoami) | grep '\bvboxusers\b') ]]; then
            sudo usermod -aG vboxusers $(whoami)
        fi
        echo " [DONE]"
    fi

    echo -n "Cleaning up packages..."
    sudo pacman -Rsn nano vi jfsutils reiserfsprogs xfsprogs pcmciautils
    echo " [DONE]"
fi


touch "$BOOTSTRAP_ROOT/.installed.post"
