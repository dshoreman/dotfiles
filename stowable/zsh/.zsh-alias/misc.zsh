hash pipes 2>/dev/null && alias afk="pipes -t0 -t1 -t3 -r10000 -Rf100"
alias weather="while true; do clear && curl wttr.in/taunton; sleep 600; done"

# Display aliases
alias 1080="xrandr --output HDMI1 --mode 1920x1080"
alias 4k="xrandr --output HDMI1 --auto --output LVDS1 --off"
alias wallpaperrot="while true; do feh --bg-scale pictures/wallpaper/4K/ --randomize; sleep 900; done"

# IRC
alias weechat="weechat -d ~/.config/weechat"

# Vim session management
vimsession() {
    local sessdir=~/.cache/vim/sessions
    local sessfile="$sessdir/$1.vim"

    mkdir -p "$sessdir"
    if [ -f "$sessfile" ]; then
        vim -S "$sessfile"
    else
        vim -c "Obsession $sessfile"
    fi
}
alias vs=vimsession

# Set gPodder config
source ~/.pam_environment
