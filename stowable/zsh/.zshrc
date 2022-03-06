#!/usr/bin/env zsh

. ~/.profile

# Required by gpg-agent? Maybe this is the secret key
# to get curses AND gtk based on the UI calling it...
export GPG_TTY=$(tty)

# Not really sure what this does, more gpg-agent stuff for SSH (git)
# https://www.gnupg.org/documentation/manuals/gnupg/Agent-Examples.html#Agent-Examples
# Except maybe we don't need gpg to handle our ssh keys...
# unset SSH_AGENT_PID
# if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
#     export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
# fi

if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty2" ]; then
    exec sway
fi

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

export PATH="${PATH}:${HOME}/dotfiles/stowable/scripts"
alias speeds="sudo iftop"

typecount() {
    ls -qU $* | awk -F . '{print $NF}' | sort | uniq -c
}
