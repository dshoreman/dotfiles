#!/usr/bin/env zsh

# Display system information where available
hash neofetch 2>/dev/null && { echo; neofetch } || {
    hash archey3 2>/dev/null && archey3
}

# Configure zplug paths
export ZPLUG_BIN=~/.local/bin
export ZPLUG_CONFIG=~/.config/zplug
export ZPLUG_HOME=~/.local/lib/zplug
export ZPLUG_CACHE_DIR=~/.cache/zplug

# Work some magic
source "$HOME/.config/zplug/zplug.zsh"

# Include .ssh/config definitions in SSH host completions
# Source: https://www.zsh.org/mla/users/2015/msg00467.html
zstyle -e ':completion:*:*:ssh:*' users-hosts \
    '[[ -f ~/.ssh/config && $key = hosts ]] && key=my_hosts reply=()'
