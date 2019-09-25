#!/usr/bin/env bash

journalctl --follow -o cat --unit "$UNIT" | while read -r; do
    if [[ "$(systemctl is-active "$UNIT")" = "active" ]]; then
        echo "%{u#55aa55}$UNIT%{u-}"
    else
        echo "%{u#e60053}$UNIT%{u-}"
    fi
    sleep 0.5
done
