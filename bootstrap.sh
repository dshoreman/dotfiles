#!/bin/bash

CWD=$(pwd)
BOOTSTRAP_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Cheeky little hack to stop sudo prompt messing with `echo -n`
sudo echo

for script in bootstrap/*.sh; do
    # Make sure each script starts in the same place
    cd "$BOOTSTRAP_ROOT"

    source bootstrap/register-services.sh
done

cd $CWD
