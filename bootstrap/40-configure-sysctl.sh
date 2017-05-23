#!/bin/bash

if [ "$OS" != "arch" ]; then
    return
fi

case $1 in
    cleanup|purge)
        echo "Removing custom sysctl configs... "

        sudo rm /etc/sysctl.d/40-inotify.conf
        ;;
    *)
        echo "Applying sysctl configs... "

        echo 'fs.inotify.max_user_watches = 524288' | sudo tee -a /etc/sysctl.d/90-inotify.conf > /dev/null
esac

sudo sysctl --system

echo "Done!"
