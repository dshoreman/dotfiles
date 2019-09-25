#!/usr/bin/env bash

pkill polybar

for m in $(polybar -m | cut -d ":" -f1); do
    MONITOR=$m polybar primary -r -q & disown
done
