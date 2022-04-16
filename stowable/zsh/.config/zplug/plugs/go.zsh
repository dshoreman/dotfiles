#!/usr/bin/env zsh

if hash go 2>/dev/null; then
    export GO=/usr/bin/go
    export GOBIN="$HOME/.local/bin/go"
    export GOPATH="$HOME/dev/go"

    export PATH="$PATH:$GOBIN"
fi
