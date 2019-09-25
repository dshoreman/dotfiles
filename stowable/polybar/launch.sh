#!/usr/bin/env bash

pkill polybar

while pgrep -u $UID -x polybar > /dev/null; do
    sleep 1
done

MONITOR=DP-0 polybar primary -r & disown
MONITOR=HDMI-0 polybar primary -r -q & disown
polybar secondary -r & disown
