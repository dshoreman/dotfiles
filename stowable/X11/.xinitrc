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

#xrandr --output DP-4 --primary --dpi 220 &
xrandr --output DP-0 --auto --primary --output DVI-I-0 --auto --right-of DP-0
xrdb -merge ~/.Xresources &
udiskie &
albert &
redshift-gtk &
nextcloud &
nextshot -t &

exec i3
