# Custom
source ~/.my-fishrc

# THEME PURE #
set fish_function_path /home/ed8/.config/fish/functions/theme-pure/functions/ $fish_function_path
set --global --export PURE_EXECUTABLE_PATH $HOME/.pure/

# >>> conda initialize >>>
source ~/miniconda3/etc/fish/conf.d/conda.fish
# !! Contents within this block are managed by 'conda init' !!
eval (eval /home/ed8/miniconda3/bin/conda "shell.fish" "hook" $argv)
# <<< conda initialize <<<

