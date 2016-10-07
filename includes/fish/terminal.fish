# disable cowlay with ansible: http://docs.ansible.com/faq.html#how-do-i-disable-cowsay
set -gx ANSIBLE_NOCOWS 1
set -gx EDITOR vim
set -gx TERM screen-256color  # support 256 color palette
set -gx VISUAL vim

function change-terminal-color-mode
    set arg "$argv[1]"; or set arg "colors=Tomorrow"
    if test -z "$TMUX"; and type konsoleprofile > /dev/null
        konsoleprofile "$arg"
    else
        printf '\033Ptmux;\033\033]50;%s\007\033\\ ' "$arg"
    end
end

# Theme mode
function night-mode
  tmux source-file $HOME/dotfiles/.tmux/themes/tomorrow-night-bright.tmux
  tmux source-file $HOME/.tmux.conf
  change-terminal-color-mode "colors=TomorrowNightBright";
end

function day-mode
  tmux source-file $HOME/dotfiles/.tmux/themes/tomorrow.tmux
  tmux source-file $HOME/.tmux.conf
  change-terminal-color-mode "colors=Tomorrow";
end

# so we can distinguish between Yakuake and Konsole (no tmux)
function konsole
    TERMINAL_CONTEXT='konsole' command konsole
end

function start_tmux
    # https://wiki.archlinux.org/index.php/Tmux#Start_tmux_on_every_shell_login
    if type tmux > /dev/null
        #if not inside a tmux session, and if no session is started, start a new session
        if test -z "$TMUX" ; and test -z $TERMINAL_CONTEXT
            tmux -2 attach; or tmux -2 new-session
        end
    end
end

start_tmux
