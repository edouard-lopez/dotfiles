#!/usr/bin/env zsh

export HISTSIZE=100000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth

# Example aliases
# alias zshconfig="mate ~/.zshrc"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"
# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# ZSH
plugins=(
        autojump
         # bower
         command-not-found django fabric
         history
         # jump
         k
         git git-extras
         npm nvm
         pip python
         ssh-agent history-substring-search
         zsh-syntax-highlighting  zsh-completions
         # yeoman
        )

# ZSH
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name
zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle ':completion:*' use-cache yes

# ZSH aliases
alias ll="k -h "

autoload -Uz compinit && compinit -i
fpath=(~/.zsh ~/.zsh/completion $fpath)

source "$HOME/.my-posixrc"
# EOF
# edouard-lopez' pure
#export PURE_EXECUTABLE_PATH=$HOME/.pure/
#source $HOME/.zsh/prompt.zsh
# sindreshorus pure

# BEGIN Added by ansbible `zsh` task
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure
# END Added by ansbible `zsh` task
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
