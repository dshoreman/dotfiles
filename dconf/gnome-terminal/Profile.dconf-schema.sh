#!/bin/sh

dconfdir="/org/gnome/terminal/legacy/profiles:/"

# TODO: Find a better way. This won't detect the ID of a completely
# clean and untouched profile. A setting must be saved first.
profile_id="$(dconf list $dconfdir | sort | sed -e 's/\///g' -n -e '1p')"

echo ":$dconfdir$profile_id/"
