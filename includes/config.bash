#!/usr/bin/env bash

function configure() {
    function refresh() { source "$HOME"/.bashrc; }

    function bash-sensible() {
        if [[ ! -f "$BASE_INCLUDE/sensible.bash" ]]; then
            curl -o sensible.bash -L https://raw.githubusercontent.com/mrzool/bash-sensible/master/sensible.bash
        fi
        source "$BASE_INCLUDE/sensible.bash"
    }
    bash-sensible
}
configure