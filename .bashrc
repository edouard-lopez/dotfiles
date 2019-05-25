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
source $HOME/.bash/prompt.bash

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ed8/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ed8/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/ed8/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/ed8/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

