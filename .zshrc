#!/usr/bin/env zsh

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
export HISTSIZE=100000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="pure" # using sindre sorhus theme https://github.com/robbyrussell/oh-my-zsh/issues/5657

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
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

source $ZSH/oh-my-zsh.sh


# ZSH
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(command-not-found composer cp debian gpg-agent git git-extras gitfast github heroku npm sprunge ssh-agent yo )

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
export PURE_EXECUTABLE_PATH=$HOME/.pure/
source $HOME/.zsh/prompt.zsh

source /home/ed8/.config/broot/launcher/bash/br
