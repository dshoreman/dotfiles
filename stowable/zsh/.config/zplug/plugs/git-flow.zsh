#!/usr/bin/env zsh

zplug "petervanderdoes/git-flow-completion"

alias gf="git flow"

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
