#!/usr/bin/env zsh

# Display system information where available
hash neofetch 2>/dev/null && { echo; neofetch } || {
    hash archey3 2>/dev/null && archey3
}

# Load generic ZSH configuration
source "config.zsh"

# Load custom aliases and helper functions
for plug in ~/.config/zplug/plugs; do
    source "${plug}"
done

# Cleanup
unset plugs
