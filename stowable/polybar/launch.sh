#!/usr/bin/env bash

pkill polybar

while pgrep -u $UID -x polybar > /dev/null; do
    sleep 1
done

polybar primary -r & disown
polybar primary-alt -r -q & disown
polybar secondary -r & disown
