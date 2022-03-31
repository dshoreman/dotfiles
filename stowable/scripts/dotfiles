#!/bin/bash

depend_on stow
cd stowable

case $1 in
    cleanup|purge)
        action="Deleting"
        action_flag="--delete"
        ;;
esac

for package in *; do
    lockfile="$package/.stowlock"
    targetfile="$package/.stowtarget"
    target=$( [[ -f $targetfile ]] && echo $(eval echo $(<$targetfile)) || echo "$HOME/.config/$package" )

    mkdir -p $target

    if [[ -z $action ]]; then
        if [[ -f "$lockfile" ]]; then
            action="Restowing"
            action_flag="--restow"
        else
            action="Stowing"
            action_flag="--stow"
        fi
    fi

    echo "$action package '$package'" && touch "$lockfile"

    [[ $target == /home/* ]] && cmd="stow" || cmd="sudo stow"

    # Stow supposedly accepts regexp but --ignore='.stow*' does nothing. This could get ugly.
    $cmd --target="$target" --ignore=".stowlock" --ignore=".stowtarget" $action_flag $package

    if [[ "$action_flag" == "--delete" ]]; then
        rm "$lockfile"
    else
        unset action action_flag
    fi
done
