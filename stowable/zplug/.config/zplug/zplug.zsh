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
source "config.zsh"

# Load custom aliases and helper functions
for plug in ~/.config/zplug/plugs; do
    source "${plug}"
done

# Make things pretty
source "theme.zsh"

# Install any new plugins then load zplug
zplug check || zplug install
zplug load
