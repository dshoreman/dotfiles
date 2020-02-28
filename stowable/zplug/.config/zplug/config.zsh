#!/usr/bin/env zsh

source "${ZPLUG_HOME}/init.zsh"

# Configure oh-my-zsh libs
ENABLE_CORRECTION="true"
HIST_STAMPS="yyyy-mm-dd"
HYPHEN_INSENSITIVE="true"

# Set the default editor
export EDITOR="vim"

# Relocate zcompdump files to ~/.cache
: ${XDG_CACHE_DIR:=~/.cache}
mkdir -p "${XDG_CACHE_DIR}/zplug"
export ZSH_ZCOMPDUMP="${XDG_CACHE_DIR}/zplug/zcompdump-${SHORT_HOST}-${ZSH_VERSION}"

# Load base plugins for shell features
zplug "lib/completion", from:oh-my-zsh
zplug "lib/correction", from:oh-my-zsh
zplug "lib/directories", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Enable automatic cd by typing only paths
setopt auto_cd

# Assign search directories for automatic cd
cdpath=(~/dev/own)

# Load key bindings
source "${ZPLUG_CONFIG}/key-bindings.zsh"

# Only show targets when completing make commands
zstyle ':completion:*:*:make:*' tag-order 'targets'

# Set gPodder config
source ~/.pam_environment
