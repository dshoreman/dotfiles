#!/usr/bin/env bash

echo -n "Adding web2mpv handler..."
mimelist="$HOME/.config/mimeapps.list"
[ -f "${mimelist}" ] && grep -q "web2mpv" "${mimelist}" || echo "x-scheme-handler/mpv=web2mpv.desktop;" >> "${mimelist}"
echo " [DONE]"

set_meld() {
    echo -n "Setting meld config key '$1' to $2... "
    gsettings set org.gnome.meld "$1" "$2" && echo "Done!"
}
set_meld use-system-font false
set_meld custom-font "'TerminessTTF Nerd Font Mono Medium 10'"
set_meld statusbar-visible false
set_meld style-scheme "'oblivion'"
set_meld folder-status-modifiers "['new', 'modified']"
set_meld folder-time-resolution 1
set_meld highlight-current-line true
set_meld highlight-syntax true
set_meld show-line-numbers true
set_meld indent-width 4
set_meld indent-spaces-instead-of-tabs true
