#!/usr/bin/env zsh

zplug "docker/cli", use:contrib/completion/zsh/_docker
zplug "docker/machine", use:contrib/completion/zsh/_docker-machine
zplug "plugins/docker-compose", from:oh-my-zsh

alias doc="docker"
alias docc="docker container"
alias doccl="docker container ls"
alias doccla="docker container ls --all"
alias docr="docker run"
alias dssh="docker-machine ssh"
