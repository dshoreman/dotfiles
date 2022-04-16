#!/usr/bin/env zsh

hash docker 2>/dev/null && \
    zplug "docker/cli", use:contrib/completion/zsh/_docker
hash docker-machine 2>/dev/null && \
    zplug "docker/machine", use:contrib/completion/zsh/_docker-machine
hash docker-composer 2>/dev/null && \
    zplug "plugins/docker-compose", from:oh-my-zsh

alias doc="docker"
alias docc="docker container"
alias doccl="docker container ls"
alias doccla="docker container ls --all"
alias docr="docker run"
alias dssh="docker-machine ssh"
