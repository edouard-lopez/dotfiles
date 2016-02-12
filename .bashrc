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

# Run twolfson/sexy-bash-prompt
. ~/.bash_prompt
