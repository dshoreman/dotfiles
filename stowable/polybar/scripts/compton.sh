#!/bin/sh

get_status() {
    if [ "$(pgrep -x picom)" ]; then
        echo "%{u#55aa55}picom%{u-}"
    else
        echo "%{u#e60053}picom%{u-}"
    fi
}

toggle_picom() {
    if [ "$(pgrep -x picom)" ]; then
        pkill picom
    else
        picom -b --experimental-backends
    fi
}

case "$1" in
    --toggle)
        toggle_picom ;;
    *)
        get_status ;;
esac
