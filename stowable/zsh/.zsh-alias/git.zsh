# Git aliases

hash 'hub' 2>/dev/null && alias git="hub"

alias gf="git flow"
alias gfe="git fetch"
alias gpf="git push --force"
alias gu="git reset HEAD"

alias cgst="clear; pwd;echo; gst"
alias cgstt="clear;pwd;echo;gst;tree"


# Git-flow Helpers

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
