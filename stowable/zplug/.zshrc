#!/usr/bin/env zsh

BULLETTRAIN_DIR_FG=236
BULLETTRAIN_DIR_BG=green
ENABLE_CORRECTION="true"
HIST_STAMPS="yyyy-mm-dd"
HYPHEN_INSENSITIVE="true"
STOWABLE=~/dotfiles/stowable

export ZPLUG_BIN=~/.local/bin
export ZPLUG_HOME=~/.local/lib/zplug
export ZPLUG_CACHE_DIR=~/.cache/zplug

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

zplug "$STOWABLE/zsh/.oh-my-zsh/custom/themes", as:theme, from:local, use:bullet-train.zsh-theme

zplug check || zplug install
zplug load
