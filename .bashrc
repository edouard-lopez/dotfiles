#!/usr/bin/env bash

# see: http://wiki.bash-hackers.org/internals/shell_options#globstar
shopt -s cmdhist
shopt -s cdspell # Correct minor spelling errors in directories
shopt -s direxpand
shopt -s dirspell
shopt -s dotglob # include .files
# shopt -s failglob # print message on failed glob
shopt -s globstar # **
shopt -s hostcomplete # complete hostname
shopt -s lithist # store multiline command with '\n' instead of ';'
#shopt -s
complete -cf sudo #tab complete for sudo

source "$HOME/.my-posixrc"

# add this configuration to ~/.bashrc
export HH_CONFIG=hicolor         # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"   # mem/file sync
# if this is interactive shell, then bind hh to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hh \C-j"'; fi

export PURE_EXECUTABLE_PATH=$HOME/.pure/

