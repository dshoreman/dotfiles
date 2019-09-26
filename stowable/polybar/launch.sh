#!/usr/bin/env bash

pkill polybar

while pgrep -u $UID -x polybar > /dev/null; do
    sleep 1
done

polybar primary -q & disown
polybar primary-alt -q & disown
polybar secondary -q & disown
