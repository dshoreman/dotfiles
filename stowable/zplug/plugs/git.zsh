#!/usr/bin/env zsh

zplug "plugins/git", from:oh-my-zsh
zplug "plugins/github", from:oh-my-zsh

alias gfe="git fetch"
alias gu="git reset HEAD"

alias gcre='git commit -e --file .git/COMMIT_EDITMSG'

git-unbuf() {
    hash unbuffer 2>/dev/null && unbuffer git $@ || git $@
}
gst() {
    git-unbuf status $@ | sed \
        -e "s/use \"git restore --staged/use \"git reset HEAD/" \
        -e "s/use \"git restore/use \"git checkout --/"
}
alias cgst="clear; pwd;echo; gst"
alias cgstt="clear;pwd;echo;gst;tree"
