# disable cowlay with ansible: http://docs.ansible.com/faq.html#how-do-i-disable-cowsay
set -gx ANSIBLE_NOCOWS 1
set -gx EDITOR vim
set -gx TERM screen-256color # support 256 color palette
set -gx VISUAL vim

function start_tmux
    # https://wiki.archlinux.org/index.php/Tmux#Start_tmux_on_every_shell_login
    if type tmux >/dev/null
        #if not inside a tmux session, and if no session is started, start a new session
        if test -z "$TMUX"
            and test -z $TERMINAL_CONTEXT
            tmux -2 attach
            or tmux -2 new-session
        end
    end
end

start_tmux
