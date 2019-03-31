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

    # Required for CUPS to locate *.local network printers. See:
    # 1. https://wiki.archlinux.org/index.php/CUPS#Network
    # 2. https://wiki.archlinux.org/index.php/Avahi#Hostname_resolution
    echo -n "Patching nsswitch for .local name resolution..."
    sudo sed -ie 's/^\(hosts: .*\) resolve/\1 mdns_minimal [NOTFOUND=return] resolve/' /etc/nsswitch.conf && echo " [DONE]"
    sudo systemctl restart avahi-daemon.service
    sudo systemctl restart org.cups.cupsd.service

    # Patch MariaDB/MySQL to prevent bullshit when BST happens
    echo -n "Patching mysql default timezone..."
    sudo sed -ie 's/^\(\[mariadb]\)$/\1\ndefault_time_zone="+0:00"/' /etc/mysql/my.cnf.d/server.cnf && echo " [DONE]"
    sudo systemctl restart mariadb.service

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
