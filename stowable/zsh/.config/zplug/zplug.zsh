#!/usr/bin/env zsh

autoload -Uz colors; colors

# Install zplug if it isn't already
if [ ! -d "${ZPLUG_HOME}" ]; then
    echo -e "${fg[blue]}Seems we're new here! Time to install zplug.${reset_color}"
    git clone https://github.com/zplug/zplug "${ZPLUG_HOME}" \
        && echo -e "${fg_bold[green]}Install complete!${reset_color}\n"
fi

# Run the initialisation bits
if [ ! -f "${ZPLUG_HOME}/init.zsh" ]; then
    echo -e "${fg_bold[red]}Could not load zplug.$reset_color"
    return 1
fi

# Load generic ZSH configuration
source "${ZPLUG_CONFIG}/config.zsh"

# Load custom aliases and helper functions
zplug "${ZPLUG_CONFIG}/plugs", from:local, defer:1

# Make things pretty
source "${ZPLUG_CONFIG}/theme.zsh"

# Install any new plugins then load zplug
zplug check || zplug install
zplug load && zplug load
