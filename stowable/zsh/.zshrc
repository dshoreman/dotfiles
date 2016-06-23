# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load
ZSH_THEME="bullet-train"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(common-aliases composer git git-flow-completion k rand-quote systemd urltools vagrant vi-mode wd web-search)

# User configuration

export PATH="$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin"
export PATH="$PATH:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"

source $ZSH/oh-my-zsh.sh

export EDITOR="vim"

# System aliases
alias df="df -h"
alias k="k -h"
alias lsk="k -Ah"
alias diff="diff -s"
alias fuck='sudo $(fc -ln -1)'
alias grepp="grep -nR --exclude-dir=vendor --exclude-dir=.git"
alias hibernate="systemctl hibernate"
alias ipaddr="ip addr | grep \"inet \" | grep -v '127.0.0.1' | awk '{ print \$7\" \"\$2 }' | sort"
alias mv="mv -v"
alias pacrefresh="sudo reflector --save /etc/pacman.d/mirrorlist --sort rate --verbose -c 'United Kingdom'"
alias pacupdate="pacrefresh; sudo pacman -Syy"
alias sysupdate="pacrefresh; sudo pacman -Syyu"
alias pbcopy="xclip -i -selection clipboard"
alias pbpaste="xclip -o -selection clipboard"
alias purge="sudo sync && sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches'"
alias ss="sudo systemctl start"
alias ssm="ss mysqld && sudo chmod o+r /var/run/mysqld/mysqld.pid"
alias startpma="ssm; /usr/share/webapps/phpMyAdmin && php -S localhost:1234"

# Git aliases
alias git="hub"
alias gf="git flow"
alias gfe="git fetch"
alias gu="git reset HEAD"
alias cgst="clear; pwd;echo; gst"
alias cgstt="clear;pwd;echo;gst;tree"
function setversion {
    echo "Setting version to $1..."
    echo "$1" > VERSION

    git add VERSION
    git commit -m 'Bump version'
}
function hotfix {
    echo "Starting hotfix branch..."
    git flow hotfix start $1
    setversion $1
}
function release {
    echo "Starting release branch..."
    git flow release start $1
    setversion $1
}

# Laravel aliases
alias pa="php artisan"
alias pas="pa serve"

# SSH aliases
alias ssh-pratchett="ssh dshoreman@pratchett.discworldemporium.com -p 22342"
alias ssh-hogfather="ssh dshoreman@hogfather.discworldemporium.com -p 22342"
alias ssh-feegle="ssh dshoreman@feegle.discworldemporium.com -p 22342"
alias ssh-lipwig="ssh dshoreman@lipwig.discworldemporium.com -p 22342"

# Media aliases
alias mplaya="mplayer -novideo -vc null -vo null -noar -msgcolor"
alias shuffle="mplayer -novideo -vc null -vo null -msgcolor -shuffle ~/music/**/*.mp3"
alias yta="mpsyt set show_video 0,"
alias ytv="mpsyt set show_video 1,"
function ytaid {
    yta url $1, 1
}
function ytvid {
    ytv url $1, 1
}

# Display aliases
alias 1080="xrandr --output HDMI1 --mode 1920x1080"
alias 4k="xrandr --output HDMI1 --auto --output LVDS1 --off"
alias wallpaperrot="while true; do feh --bg-scale pictures/wallpaper/4K/ --randomize; sleep 900; done"

fork() { (setsid "$@" &); }

archey3 && quote
alias afk="pipes -t0 -t1 -t3 -r10000 -Rf100"
