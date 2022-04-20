#!/usr/bin/env zsh

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

vimsession-recreate() {
    local sessdir=~/.cache/vim/sessions
    local sessfile="$sessdir/$1.vim"

    [ -f "$sessfile" ] && rm -f "$sessfile"

    vimsession "$1"
}

alias v=vim
alias vs=vimsession
alias vsr=vimsession-recreate
alias :q="exit"
