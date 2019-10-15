#!/usr/bin/env bash

internal=$(find ~/.local/share/Trash/files/ -maxdepth 1 | wc -l)
external=$(find /run/media/*/*/.Trash-1000/files/ -maxdepth 1 2>/dev/null | wc -l)

echo " "$(( internal + external ))
