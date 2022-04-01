#!/usr/bin/env zsh

if hash git-flow 2>/dev/null; then
    zplug "petervanderdoes/git-flow-completion"

    alias gf="git flow"

    hotfix() {
        echo "Starting hotfix branch..."
        git flow hotfix start $1
        setversion $1
    }

    release() {
        echo "Starting release branch..."
        git flow release start $1
        setversion $1
    }
fi

setversion() {
    echo "Setting version to $1..."
    echo "$1" > VERSION

    git add VERSION
    git commit -m 'Bump version'
}
