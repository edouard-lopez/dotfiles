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
