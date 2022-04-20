#!/usr/bin/env zsh

alias yta="mpsyt set show_video 0,"
alias ytv="mpsyt set show_video 1,"

function ytaid {
    yta url $1, 1
}

function ytvid {
    ytv url $1, 1
}
