#!/usr/bin/env zsh

source "${ZPLUG_HOME}/init.zsh"

# Configure oh-my-zsh libs
ENABLE_CORRECTION="true"
HIST_STAMPS="yyyy-mm-dd"
HYPHEN_INSENSITIVE="true"

# Set the default editor
export EDITOR="vim"

# Load base plugins for shell features
zplug "lib/completion", from:oh-my-zsh
zplug "lib/correction", from:oh-my-zsh
zplug "lib/directories", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
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