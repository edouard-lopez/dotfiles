# disable cowlay with ansible: http://docs.ansible.com/faq.html#how-do-i-disable-cowsay
set -gx ANSIBLE_NOCOWS 1
set -gx EDITOR vim
set -gx VISUAL vim

set --universal --export BASE16_THEME_DEFAULT "base-ayu-dark"
set --universal --export BASE16_TMUX_OPTION_ACTIVE 1
set --universal --export BASE16_TMUX_OPTION_STATUS 0

if status is-interactive
    if not set -q TMUX
        if set -q VSCODE_WORKSPACE
            # skip as not yet supported in VSCode https://github.com/microsoft/vscode/pull/233526
            # exec tmux new-session -A -t "$VSCODE_WORKSPACE" 
        else
            exec tmux new-session -A -t default
        end
    end
end

direnv hook fish | source
