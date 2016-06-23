#!/bin/bash

if [ $OS != "arch" ]; then
    return
fi

SYSD_UNITDIR="/etc/systemd/system"

cd services

case $1 in
    cleanup|purge)
        # Run cleanup in reverse to make sure that timers
        # get stopped *before* the service is removed.
        # If we don't, systemd bitches about it.
        for unit in *.{timer,service}; do
            echo -n "Cleaning up $unit..."

            if [ $(systemctl is-active "$unit") ]; then
                sudo systemctl stop "$unit"
            fi

            if [ $(systemctl is-enabled "$unit") ]; then
                sudo systemctl disable "$unit"
            fi

            sudo rm "$SYSD_UNITDIR/$unit"
            echo " Done!"
        done

        for unit in *.service.d; do
            echo -n "Cleaning up $unit configs... "; cd "$unit"

            for config in *; do
                sudo rm "$SYSD_UNITDIR/$unit/$config"
            done

            sudo rm -d "$SYSD_UNITDIR/$unit"; cd ..; echo "Done!"
        done
        ;;
    *)
        for unit in *.{service,timer}; do
            echo -n "Installing $unit... "
            sudo cp "$BOOTSTRAP_ROOT/services/$unit" "$SYSD_UNITDIR/" && sudo chmod a+x "$SYSD_UNITDIR/$unit"
            sudo systemctl enable "$unit"
            sudo systemctl start "$unit"
            echo "Done!"
        done

        for unit in *.service.d; do
            echo -n "Applying configs for $unit... "

            if [ ! -d "$SYSD_UNITDIR/$unit" ]; then
                sudo mkdir "$SYSD_UNITDIR/$unit"
            fi

            sudo cp $BOOTSTRAP_ROOT/services/$unit/* "$SYSD_UNITDIR/$unit/"
            echo "Done!"
        done
esac

sudo systemctl daemon-reload

unset unit config SYSD_UNITDIR
