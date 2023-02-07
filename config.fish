# Custom
source ~/.my-fishrc

# THEME PURE #
set fish_function_path /home/ed8/.config/fish/functions/theme-pure/functions/ $fish_function_path
set --global --export PURE_EXECUTABLE_PATH $HOME/.pure/
set --global --export VOLTA_HOME $HOME/.volta
set --append --export --global PATH $VOLTA_HOME/bin
set --global --export PNPM_HOME $HOME/.local/share/pnpm

