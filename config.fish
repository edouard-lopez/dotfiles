# Custom
source ~/.my-fishrc

set --append fish_function_path /home/ed8/.config/fish/functions/echo-colored/ # https://github.com/PeterDaveHello/ColorEchoForShell/

# THEME PURE #
set fish_function_path /home/ed8/.config/fish/functions/theme-pure/functions/ $fish_function_path
set --global --export PURE_EXECUTABLE_PATH $HOME/.pure/
set --global --export VOLTA_HOME $HOME/.volta
fish_add_path --append $VOLTA_HOME/bin

# pnpm
set -gx PNPM_HOME /home/ed8/.local/share/pnpm
fish_add_path --append $PNPM_HOME
# pnpm end
source $HOME/.asdf/asdf.fish

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true
fish_add_path --append $HOME/.krew/bin

set -gx GOPATH $HOME/go; set -gx GOROOT $HOME/.go; set -gx PATH $GOPATH/bin $PATH; # g-install: do NOT edit, see https://github.com/stefanmaric/g

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

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
