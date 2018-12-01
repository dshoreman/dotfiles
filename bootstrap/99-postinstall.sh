#!/bin/sh

if [ -f "$BOOTSTRAP_ROOT/.installed.post" ]; then
    return
fi

echo
echo "Almost done! Now for some last few finishing touches..."
echo

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
