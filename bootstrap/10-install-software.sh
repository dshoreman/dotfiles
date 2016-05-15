#!/bin/bash
cd packages

for group in *; do
    echo "Loading packages from group $group"
    pkglist=""

    while read -r package; do
        pkglist+=" $package"
        echo $pkglist
    done <<< $(grep -vE '^(\s*$|#)' "$group")

    pacaur -S $pkglist
done
