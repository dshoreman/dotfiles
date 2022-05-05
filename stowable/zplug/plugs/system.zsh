#!/usr/bin/env zsh

function bgstart {
    $1 &>/dev/null &
    disown
}

fork() { (setsid "$@" &); }

alias 1080="xrandr --output HDMI1 --mode 1920x1080"
alias 4k="xrandr --output HDMI1 --auto --output LVDS1 --off"

alias ss="sudo systemctl start"

alias ipaddr="ip addr | \grep \"inet \" | \grep -v '127.0.0.1' | awk '{ print \$7\" \"\$2 }' | sort"

alias purge="sudo sync && sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches'"
