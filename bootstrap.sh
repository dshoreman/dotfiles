#!/bin/bash

CWD=$(pwd)
BOOTSTRAP_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Cheeky little hack to stop sudo prompt messing with `echo -n`
sudo echo

function depend_on
{
    hash $1 2>/dev/null && return

    case $OS in
        arch )
            sudo pacman -S $1
            ;;
        ubuntu )
            sudo apt-get install -qy $1
            ;;
        * )
            echo "Install failed. Missing dependency ${1}"
            exit 1
            ;;
    esac
}

OS=$(grep "ID=" /etc/os-release | sed 's/ID=//')

for script in $BOOTSTRAP_ROOT/bootstrap/*.sh; do
    # Make sure each script starts in the same place
    cd "$BOOTSTRAP_ROOT"

    source $script
done

cd $CWD
