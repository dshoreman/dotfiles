#!/usr/bin/env zsh

zplug "plugins/git", from:oh-my-zsh

alias gfe="git fetch"
alias gu="git reset HEAD"

alias gst='unbuffer git status | sed -e "s/use \"git restore --staged/use \"git reset HEAD/" -e "s/use \"git restore/use \"git checkout --/"'
alias cgst="clear; pwd;echo; gst"
alias cgstt="clear;pwd;echo;gst;tree"
