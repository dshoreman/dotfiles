#!/usr/bin/env zsh

alias packeys="sudo pacman-key --refresh-keys"
alias pacmlist='sudo reflector --save /etc/pacman.d/mirrorlist --score 5 --sort rate --verbose -p https -c "United Kingdom" && sudo pacman -Syy'

alias pacrefresh="pacmlist && packeys"
