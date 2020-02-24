#!/bin/sh

if [ -f "$HOME/.Xresources" ]; then
    xrdb -merge "$HOME/.Xresources"
fi

if [ -f "$HOME/.Xmodmap" ]; then
    xmodmap "$HOME/.Xmodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

numlockx &
setxkbmap \
    -option compose:menu \
    -option keypad:pointerkeys \
    -option caps:ctrl_modifier
xcape -e 'Caps_Lock=Escape'

# We seem to need this to position the left monitor, despite the xorg config.
xrandr --output HDMI-0 --auto --left-of DP-0 && xrandr --output HDMI-0 --pos 0x900

udiskie -ta -m nested &
albert &
redshift-gtk &
nextcloud &
nextshot -t &

exec i3
