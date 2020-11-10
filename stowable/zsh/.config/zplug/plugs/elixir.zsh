#!/usr/bin/env zsh

zplug "plugins/mix", from:oh-my-zsh

export ERL_AFLAGS="-kernel shell_history enabled"
export MIX_HOME="$HOME/.cache/ex-mix"
