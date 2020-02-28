#!/usr/bin/env zsh

BULLETTRAIN_CONTEXT_DEFAULT_USER="dshoreman"
BULLETTRAIN_DIR_FG=236
BULLETTRAIN_DIR_BG=green
BULLETTRAIN_NVM_FG=65
BULLETTRAIN_STATUS_BG=blue
BULLETTRAIN_STATUS_EXIT_SHOW=true
ENABLE_CORRECTION="true"
HIST_STAMPS="yyyy-mm-dd"
HYPHEN_INSENSITIVE="true"
STOWABLE=~/dotfiles/stowable

export EDITOR="vim"
export ERL_AFLAGS="-kernel shell_history enabled"
export GOBIN="$HOME/.local/bin/go"
export GOPATH="$HOME/dev/go"
export MIX_HOME="$HOME/.cache/ex-mix"
export ZPLUG_BIN=~/.local/bin
export ZPLUG_HOME=~/.local/lib/zplug
export ZPLUG_CACHE_DIR=~/.cache/zplug
export PATH="$PATH:$GOBIN"

autoload -Uz colors; colors

if [ ! -d "${ZPLUG_HOME}" ]; then
    echo -e "${fg[blue]}Seems we're new here! Time to install zplug.${reset_color}"
    git clone https://github.com/zplug/zplug "${ZPLUG_HOME}" \
        && echo -e "${fg_bold[green]}Install complete!${reset_color}\n"
fi

if [ ! -f "${ZPLUG_HOME}/init.zsh" ]; then
    echo -e "${fg_bold[red]}Could not load zplug.$reset_color"
    return 1
fi

source "${ZPLUG_HOME}/init.zsh"

zplug "lib/completion", from:oh-my-zsh
zplug "lib/correction", from:oh-my-zsh
zplug "lib/directories", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh

zplug "dshoreman/bullet-train.zsh", at:smart-versions, as:theme

source "$HOME/.config/zplug/zplug.zsh"
zplug check || zplug install
zplug load
