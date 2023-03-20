# Custom
source ~/.my-fishrc

# THEME PURE #
set fish_function_path /home/ed8/.config/fish/functions/theme-pure/functions/ $fish_function_path
set --global --export PURE_EXECUTABLE_PATH $HOME/.pure/
set -gx VOLTA_HOME $HOME/.volta
fish_add_path --append PATH $VOLTA_HOME/bin
set --global --export VOLTA_HOME $HOME/.volta

# pnpm
set -gx PNPM_HOME /home/ed8/.local/share/pnpm
set --append --export --global PATH $PNPM_HOME
# pnpm end
source $HOME/.asdf/asdf.fish

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true
