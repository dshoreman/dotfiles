#!/bin/sh

profile_id="$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'")"

echo ":/org/gnome/terminal/legacy/profiles:/:$profile_id/"
