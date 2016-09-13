#!/usr/bin/env bash

function configure() {
    files=('n' 'akema' )  # rc files to load
    for file in "${files[@]}"; do
        filerc="$HOME/.${file}rc"
        if [[ -f "$filerc" || -h "$filerc" ]]; then
            # shellcheck source=/dev/null
            source "$filerc"
        fi
    done
}
configure
