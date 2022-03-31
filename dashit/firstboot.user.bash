#!/usr/bin/env bash

gset() {
    schema="${1//chooser/org.gtk.Settings.FileChooser}"
    schema="${schema//rhythm/org.gnome.rhythmbox}"
    schema="${schema//meld/org.gnome.meld}"
    schema="${schema//vm/org.virt-manager.virt-manager}"

    echo -n "  Setting value of '$1' in $schema to $2... "
    gsettings set "$schema" "$2" "$3" && echo "Done!"
}

echo -n "Adding web2mpv handler..."
mimelist="$HOME/.config/mimeapps.list"
[ -f "${mimelist}" ] && grep -q "web2mpv" "${mimelist}" || echo "x-scheme-handler/mpv=web2mpv.desktop;" >> "${mimelist}"
echo " [DONE]"

echo; echo "Configuring GTK file chooser..."
gset chooser date-format with-time
gset chooser sort-column modified
gset chooser sort-order descending
gset chooser startup-mode cwd
gset chooser type-format mime

echo; echo "Configuring Rhythmbox..."
gset rhythm time-display false
gset rhythm.player transition-time 3
gset rhythm.player use-xfade-backend true
gset rhythm.sources browser-views genres-artists-albums

echo; echo "Configuring Meld..."
gset meld use-system-font false
gset meld custom-font "'TerminessTTF Nerd Font Mono Medium 10'"
gset meld statusbar-visible false
gset meld style-scheme "'oblivion'"
gset meld folder-status-modifiers "['new', 'modified']"
gset meld folder-time-resolution 1
gset meld highlight-current-line true
gset meld highlight-syntax true
gset meld show-line-numbers true
gset meld indent-width 4
gset meld indent-spaces-instead-of-tabs true

echo; echo "Configuring Virt Manager..."
gset vm xmleditor-enabled true
gset vm.confirm forcepoweroff false
gset vm.confirm removedev false
gset vm.confirm unapplied-dev false
gset vm.connections autoconnect "['qemu:///system']"
gset vm.connections uris "['qemu:///system']"
