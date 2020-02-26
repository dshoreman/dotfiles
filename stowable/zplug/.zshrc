#!/usr/bin/env zsh

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

zplug check || zplug install
zplug load
