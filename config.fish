# Custom
source ~/.my-fishrc

set --append fish_function_path /home/ed8/.config/fish/functions/echo-colored/ # https://github.com/PeterDaveHello/ColorEchoForShell/

# THEME PURE #
set fish_function_path /home/ed8/.config/fish/functions/theme-pure/functions/ $fish_function_path
set --global --export PURE_EXECUTABLE_PATH $HOME/.pure/

set --universal pure_show_exit_status true
set --universal pure_convert_exit_status_to_signal true
set --universal fish_transient_prompt 1

if [ -n "$TMUX" ]
    #    set -x SSH_AUTH_SOCK (tmux show-environment | grep '^SSH_AUTH_SOCK' | cut -d '=' -f2-)
    keychain -q ~/.ssh/id_rsa
end
source ~/.keychain/$(hostname)-sh 2> /dev/null

for file in $HOME/dotfiles/includes/fish/functions/*.fish
    source $file
end

thefuck --alias | source

