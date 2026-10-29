# XDG stuff
set --global --export XDG_DATA_HOME $HOME/.local/share
set --universal --export XDG_CONFIG_HOME $HOME/.config

# Udate CD pathes
set --global --export --append CDPATH \
    . \
    $HOME \
    $HOME/projects/* \
    $HOME/projects/*/* 

# Udpate PATH
fish_add_path --append ./node_modules/.bin
fish_add_path --append ./.venv/bin
fish_add_path --append $HOME/.yarn/bin
fish_add_path --append $HOME/.local/bin
fish_add_path --append $HOME/.config/yarn/global/node_modules/.bin
fish_add_path --append $HOME/apps
fish_add_path --append /bin
fish_add_path --append /snap/bin
fish_add_path --append /usr/bin
fish_add_path --append /usr/local/bin
fish_add_path --append /usr/local/sbin
fish_add_path --append /usr/sbim
set --append fish_function_path $HOME/.config/fish/functions/echo-colored/ # https://github.com/PeterDaveHello/ColorEchoForShell/

# GPG Agent and GPG signing
set --global --export GPG_TTY (tty)


# TMUX
if [ -n "$TMUX" ]
    #    set -x SSH_AUTH_SOCK (tmux show-environment | grep '^SSH_AUTH_SOCK' | cut -d '=' -f2-)
    keychain -q $HOME/.ssh/id_rsa
end
source $HOME/.keychain/$(hostname)-sh 2> /dev/null


# icons-in-terminal integration: https://github.com/sebastiencs/icons-in-terminal
source ~/.local/share/icons-in-terminal/icons.fish


# Override functions
for file in $HOME/dotfiles/includes/fish/*.fish
    # echo "Sourcing "(basename $file)
    source $file
end


# Load work config
if test -f $HOME/.config/work/config.fish
    source $HOME/.config/work/config.fish
end


# THEME PURE #
set fish_function_path $HOME/.config/fish/functions/theme-pure/functions/ $fish_function_path
set --global --export PURE_EXECUTABLE_PATH $HOME/.pure/

set --universal pure_show_exit_status true
set --universal pure_convert_exit_status_to_signal true
set --universal fish_transient_prompt 1

# The fuck
thefuck --alias | source

set --global --export BROWSER firefox # Default web browser
