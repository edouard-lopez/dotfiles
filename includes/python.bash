#!/usr/bin/env bash

function configure() {
    export WORKON_HOME=$HOME/.env
    venvBin=/usr/local/bin/virtualenvwrapper.sh
    # shellcheck source=/dev/null
    [[ -e "$venvBin" ]] && source "$venvBin"
}
configure
