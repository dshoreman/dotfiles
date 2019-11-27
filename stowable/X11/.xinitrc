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

# These commands MUST be separated or we end up with a gap between HDMI-0 and DP-0,
# which in turn causes slop to kill compton and display a black screen.
xrandr --output DP-0 --auto --primary --output DVI-I-0 --mode 1440x900 --rate 74.98 --rotate left --right-of DP-0
xrandr --output HDMI-0 --auto --pos 0x900

udiskie &
albert &
redshift-gtk &
nextcloud &
nextshot -t &

exec i3
