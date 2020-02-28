#!/usr/bin/env zsh

# Page{Up,Dn} to navigate through history
bindkey '[5~' up-line-or-history
bindkey '[5~' down-line-or-history

# Bind up/down to previous line from history
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '[A' up-line-or-beginning-search
bindkey '[B' down-line-or-beginning-search

# History completion such as `!1 `
bindkey ' ' magic-space

# Home+End to the start/end of the line
bindkey '[H' beginning-of-line
bindkey '[F' end-of-line

# Move between words with ctrl+arrows
bindkey '[1;5D' backward-word
bindkey '[1;5C' forward-word

# Reverse menu completion on shift-tab
bindkey "${terminfo[kcbt]}" reverse-menu-complete

# Delete chars
bindkey '^?' backward-delete-char
bindkey '[3~' delete-char

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# Copy previous word with alt-m
bindkey 'm' copy-prev-shell-word
