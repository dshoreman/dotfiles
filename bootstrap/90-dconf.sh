#!/bin/bash

if [ "$OS" != "arch" ]; then
    return
fi

GLOBIGNORE=*.*
cd dconf

for app in *; do
    cd "$BOOTSTRAP_ROOT/dconf/$app"
    path_prefix="$(<default.dconf-schema)"

    for config in *; do
        schema="$path_prefix.$config"
        echo "Loading configs for $schema"

        if [ -f $config.dconf-schema.sh ]; then
            schema+="$(./$config.dconf-schema.sh)"
        fi

        set -f

        grep -vE '^(\s*$|#)' "$config" | while read -r key val; do
            case $1 in
                cleanup|purge)
                    gsettings reset $schema $key
                    ;;
                *)
                    gsettings set $schema $key "$val"
            esac
        done

        set +f
    done
done

unset GLOBIGNORE
