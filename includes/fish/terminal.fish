# disable cowlay with ansible: http://docs.ansible.com/faq.html#how-do-i-disable-cowsay
set -gx ANSIBLE_NOCOWS 1
set -gx EDITOR vim
set -gx VISUAL vim

set --universal --export BASE16_THEME_DEFAULT "ayu-light"
set --universal --export BASE16_TMUX_OPTION_ACTIVE 1
set --universal --export BASE16_TMUX_OPTION_STATUS 0

function start_tmux
    # https://wiki.archlinux.org/index.php/Tmux#Start_tmux_on_every_shell_login
    if type --query tmux
        #if not inside a tmux session, and if no session is started, start a new session
        if test -z "$TMUX"
            and test -z $TERMINAL_CONTEXT
            tmux -2 attach
            or tmux -2 new-session
        end
    end
end

start_tmux

direnv hook fish | source
