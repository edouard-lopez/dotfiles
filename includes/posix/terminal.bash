#!/usr/bin/env bash

function configure() {
    # disable cowlay with ansible: http://docs.ansible.com/faq.html#how-do-i-disable-cowsay
    export ANSIBLE_NOCOWS=1
    export EDITOR=vim
    export VISUAL=vim

    function change-terminal-color-mode() {
        arg="${1:-colors=base16-tomorrow}"
        if [[ -z "$TMUX" ]] && type konsoleprofile &> /dev/null; then
            konsoleprofile "$arg"
        else
            printf '\033Ptmux;\033\033]50;%s\007\033\\' "$arg"
        fi
    }

    # Theme mode
    function night-mode() {
  		change-terminal-color-mode "colors=base16-tomorrow-night";
        tmux source-file "$HOME/dotfiles/.tmux/themes/tomorrow-night-bright.tmux"
  		tmux source-file "$HOME/.tmux.conf"
  	}

      function day-mode() {
  		change-terminal-color-mode "colors=base16-tomorrow";
  		tmux source-file ~/dotfiles/.tmux/themes/tomorrow.tmux
          tmux source-file "$HOME/.tmux.conf"
  	}

    # so we can distinguish between Yakuake and Konsole (no .tmux)
    function konsole() {
        TERMINAL_CONTEXT='konsole' command konsole
    }

    function start_tmux() {
        # https://wiki.archlinux.org/index.php/Tmux#Start_tmux_on_every_shell_login
        if type tmux &> /dev/null; then
            #if not inside a .tmux session, and if no session is started, start a new session
            if [[ $HOST == "laptop" && -z "$TMUX" && -z $TERMINAL_CONTEXT ]]; then
                (tmux -2 attach || tmux -2 new-session)
            fi
        fi
    }

    start_tmux
}
configure
