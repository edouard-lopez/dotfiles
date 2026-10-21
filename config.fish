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
set --universal --export --append SMART_LOCK_DEVICES_MACS "D0:49:7C:1F:6E:DC" # OnePlus 9 Pro
set --universal --export --append SMART_LOCK_BSSIDS "16:E8:29:6E:C0:4B" # OnePlus 9 Pro
set --universal --export --append SMART_LOCK_DEVICES_MACS "D3:A3:DB:AB:32:61" # MX Vertica
