#!/usr/bin/env zsh

zplug "plugins/vi-mode", from:oh-my-zsh

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

alias v=vim
alias vs=vimsession
alias :q="exit"
