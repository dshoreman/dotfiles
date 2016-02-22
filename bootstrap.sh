#!/bin/bash

CWD=$(pwd)
BOOTSTRAP_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Cheeky little hack to stop sudo prompt messing with `echo -n`
sudo echo

function depend_on
{
    hash $1 2>/dev/null || sudo pacman -S $1
}

for script in $BOOTSTRAP_ROOT/bootstrap/*.sh; do
    # Make sure each script starts in the same place
    cd "$BOOTSTRAP_ROOT"

    source $script
done

cd $CWD
