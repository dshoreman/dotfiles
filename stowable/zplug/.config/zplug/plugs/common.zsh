#!/usr/bin/env zsh

unalias k 2>/dev/null
unalias l 2>/dev/null

zplug "supercrabtree/k"
zplug "plugins/urltools", from:oh-my-zsh
zplug "plugins/wd", from:oh-my-zsh

alias df="df -h"
alias diff="diff -s"
alias fuck='sudo $(fc -ln -1)'
alias grep="grep --color"

alias k="k -h"
alias \;=k
alias l="k"
alias la="k -A"
alias ll="k"
alias lS="ls -lFSsh"
alias tree="tree -I vendor"

alias cp="cp -i"
alias mv="mv -iv"
alias rm="rm -i"

alias pbcopy="xclip -i -selection clipboard"
alias pbpaste="xclip -o -selection clipboard"
