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

# add this configuration to ~/.bashrc
export HH_CONFIG=hicolor         # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"   # mem/file sync
# if this is interactive shell, then bind hh to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hh \C-j"'; fi