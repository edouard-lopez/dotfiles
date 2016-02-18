# Fisherman
set fisher_home ~/.local/share/fisherman
set fisher_config ~/.config/fisherman
source $fisher_home/config.fish


# Paths to your tackle
set tacklebox_path ~/.tackle ~/.tacklebox

# Theme
#set tacklebox_theme entropy

# Which modules would you like to load? (modules can be found in ~/.tackle/modules/*)
# Custom modules may be added to ~/.tacklebox/modules/
set tacklebox_modules virtualfish virtualhooks z

# Which plugins would you like to enable? (plugins can be found in ~/.tackle/plugins/*)
# Custom plugins may be added to ~/.tacklebox/plugins/
set tacklebox_plugins docker pip grc

# Load Tacklebox configuration
. ~/.tacklebox/tacklebox.fish

# Custom
source ~/.my-fishrc

# THEME PURE #
set fish_function_path $HOME/.config/fish/functions/theme-pure $fish_function_path

