source /etc/profile.d/vte.sh

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="bullet-train"

BULLETTRAIN_DIR_BG=green
BULLETTRAIN_DIR_FG=236

HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="false"
HIST_STAMPS="yyyy-mm-dd"

hash archey3 2>/dev/null && archey3
hash neofetch 2>/dev/null && echo && neofetch

unalias k 2>/dev/null
plugins=(kopy common-aliases composer git git-flow-completion k systemd urltools vagrant vi-mode wd web-search)

export EDITOR="vim"
export GOPATH="$HOME/go"
export MIX_HOME="$HOME/.cache/ex-mix"
export ERL_AFLAGS="-kernel shell_history enabled"

export PATH="$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin"
export PATH="$PATH:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

source $ZSH/oh-my-zsh.sh

for file in ~/.zsh-alias/*.zsh; do
    . $file
done

unalias l 2>/dev/null
alias ll="k -h"
alias l="ll"
alias la="ll -A"
