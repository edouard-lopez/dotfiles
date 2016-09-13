#!/usr/bin/env bash

function configure() {
    function refresh() { source "$HOME"/.bashrc; }

    function bash-sensible() {
        if [[ ! -f ./sensible.bash ]]; then
            curl -o sensible.bash -L https://raw.githubusercontent.com/mrzool/bash-sensible/master/sensible.bash
        fi
        source ./sensible.bash
    }
    bash-sensible
}
configure
