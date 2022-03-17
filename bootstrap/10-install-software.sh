#!/bin/bash
cd packages

if [ -f "$BOOTSTRAP_ROOT/.installed" ]; then
    return
fi

if [ "$OS" != "arch" ]; then
    echo "Skipping packages, not running Arch."
else
    for group in *; do
        echo "Loading packages from group $group"
        pkglist=""

        while read -r package; do
            pkglist+=" $package"
            echo $pkglist
        done <<< $(grep -vE '^(\s*$|#)' "$group")

        pacaur -S $pkglist
    done
fi

# Remove default zshrc ready for stow to replace our own
rm ~/.zshrc

touch "$BOOTSTRAP_ROOT/.installed"
