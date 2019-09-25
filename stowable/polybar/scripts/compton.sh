#!/bin/sh

get_status() {
    if [ "$(pgrep -x compton)" ]; then
        echo "%{u#55aa55}compton%{u-}"
    else
        echo "%{u#e60053}compton%{u-}"
    fi
}

toggle_compton() {
    if [ "$(pgrep -x compton)" ]; then
        pkill compton
    else
        compton -b
    fi
}

case "$1" in
    --toggle)
        toggle_compton ;;
    *)
        get_status ;;
esac
