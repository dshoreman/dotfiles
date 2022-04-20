#!/usr/bin/env bash

xrandr | grep XWAYLAND && exit
pkill polybar

while pgrep -u $UID -x polybar > /dev/null; do
    sleep 1
done

for definition in $(polybar -m | sed 's/\(.*\): \(.*\)x.*/\1:\2/'); do
    out=$(echo "$definition" | cut -d: -f1)
    res=$(echo "$definition" | cut -d: -f2)

    if (( res >= 1920 )); then
        MONITOR=$out polybar primary -q & disown
    else
        MONITOR=$out polybar secondary -q & disown
    fi
done
