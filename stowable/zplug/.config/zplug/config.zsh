#!/usr/bin/env zsh

zplug "zsh-users/zsh-history-substring-search"

# Enable automatic cd by typing only paths
setopt auto_cd

# Assign search directories for automatic cd
cdpath=(~/dev/own)

# Bind up and down to history search
bindkey '[A' history-substring-search-up
bindkey '[B' history-substring-search-down

# Only show targets when completing make commands
zstyle ':completion:*:*:make:*' tag-order 'targets'

# Set gPodder config
source ~/.pam_environment
