# XDG stuff
set --global --export XDG_DATA_HOME $HOME/.local/share
set --universal --export XDG_CONFIG_HOME $HOME/.config
set --global --export BROWSER firefox # Default web browser
set --global --export PROJECTS $HOME/projets # prevent data stealing of projects/
set KEYCHAIN_KEYS \
    ~/.ssh/id_ed25519

# Udate CD pathes
set --global --export --append CDPATH \
    . \
    $HOME \
    $HOME/projets/* \
    $HOME/projets/*/* 

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
fish_add_path --append $GOPATH/bin
fish_add_path --append $GOBIN/bin

# GPG Agent and GPG signing
set --global --export GPG_TTY (tty)


# # TMUX
# if [ -n "$TMUX" ]
#     #    set -x SSH_AUTH_SOCK (tmux show-environment | grep '^SSH_AUTH_SOCK' | cut -d '=' -f2-)
#     keychain -q $HOME/.ssh/id_rsa
# end
# source $HOME/.keychain/$(hostname)-sh 2> /dev/null


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

source $HOME/.asdf/asdf.fish

if [ -n "$TMUX" ]
    set -x SSH_AUTH_SOCK (tmux show-environment | grep '^SSH_AUTH_SOCK' | cut -d '=' -f2-)
end

for file in $HOME/dotfiles/includes/fish/functions/*.fish
    source $file
end

thefuck --alias | source

set --universal SMART_LOCK_BSSIDS
set --universal --export --append SMART_LOCK_BSSIDS "02:B2:8C:55:EA:8F" # Home 5G
set --universal --export --append SMART_LOCK_BSSIDS "02:B2:8C:55:EA:8B" # Home
set --universal --export --append SMART_LOCK_BSSIDS "4A:E9:18:CD:45:91" # 
set --universal --export --append SMART_LOCK_BSSIDS "00:24:D4:95:69:FE" # Payotte & Mayotte
set --universal --export --append SMART_LOCK_BSSIDS "52:43:F0:8D:7A:0F" # Phone
set --universal SMART_LOCK_DEVICES_MACS
set --universal --export --append SMART_LOCK_DEVICES_MACS "D0:49:7C:1F:6E:DC" # Phone 9 Pro
set --universal --export --append SMART_LOCK_DEVICES_MACS "10:94:97:37:2B:E4" # Speaker EVERBOOM
set --universal --export --append SMART_LOCK_DEVICES_MACS "D1:F5:11:70:E0:FB" # Mouse LIFT (left)
set --universal --export --append SMART_LOCK_DEVICES_MACS "60:AB:D2:3C:E6:18" # Éd - Bose QC35 II
set --universal --export --append SMART_LOCK_DEVICES_MACS "20:74:CF:AB:A9:05" # OpenRun by Shokz
set --universal --export --append SMART_LOCK_DEVICES_MACS "D3:A3:DB:AB:32:64" # Mouse MX Vertical (right)


abbr -a -- compose-kbd 'setxkbmap -option compose:caps'
