#!/bin/sh

dconfdir="/org/gnome/terminal/legacy/profiles:/"

profile_id="$(dconf list $dconfdir | sort | sed -e 's/\///g' -n -e '1p')"

echo ":$dconfdir$profile_id/"
