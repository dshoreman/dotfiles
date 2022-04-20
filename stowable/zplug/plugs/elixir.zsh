#!/usr/bin/env zsh

hash mix 2>/dev/null && zplug "plugins/mix", from:oh-my-zsh

export ERL_AFLAGS="-kernel shell_history enabled"
export MIX_HOME="$HOME/.cache/ex-mix"
