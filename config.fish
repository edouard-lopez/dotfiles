# Path to Oh My Fish install.
set -gx OMF_PATH /home/elopez/.local/share/omf

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG /home/elopez/.config/omf

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

source ~/.my-fishrc

# THEME PURE #
set fish_function_path $HOME/.config/fish/functions/theme-pure $fish_function_path
