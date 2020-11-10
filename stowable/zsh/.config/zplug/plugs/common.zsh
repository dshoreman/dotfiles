#!/usr/bin/env zsh

zplug "junegunn/fzf", use:"shell/*.zsh", defer:2
zplug "plugins/urltools", from:oh-my-zsh
zplug "plugins/wd", from:oh-my-zsh

alias cat="bat"
alias df="df -h"
alias diff="diff -s"
alias fuck='sudo $(fc -ln -1)'
alias grep="grep --color"

alias cp="cp -i"
alias mv="mv -iv"
alias rm="rm -i"

alias pbcopy="xclip -i -selection clipboard"
alias pbpaste="xclip -o -selection clipboard"
