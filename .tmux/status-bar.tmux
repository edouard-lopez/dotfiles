set -g status on
bind-key b set-option status  # toggle statusbar

set-option -g status-justify left

# status left options
set-option -g status-left '#[fg=black][#S]#[default] '
set-option -g status-left-length 20

# window list options
set-window-option -g automatic-rename on
set-window-option -g window-status-format '#I:#W'
set-window-option -g window-status-current-format '#[bg=green,fg=white,bold]#I:#W'

# status right options
set -g @batt_charged_icon '#[fg=green,bold]✔'
set -g @batt_charging_icon '#[fg=yellow,bold]▴'  # ⚡
set -g @batt_discharging_icon '#[fg=red,bold]▾'  # '🔋'
set -g @batt_attached_icon '#[fg=cyan,bold]🔌'  #
set -g status-right-length 100
set -g status-right '#[fg=blue]%a %d %b#[default] ⌚ #[fg=yellow]%H#[default]:#[fg=yellow]%M #[default]| #[fg=blue]⇣#{download_speed} #[fg=green]⇡#{upload_speed}#[default] | #{battery_icon}#[fg=black]#{battery_percentage} '


# Allow the title bar to adapt to whatever host you connect to: https://wiki.archlinux.org/index.php/Tmux#Terminal_emulator_window_titles
set -g set-titles on
# wm window title string (uses statusbar variables)
set -g set-titles-string "#T"
# set -g set-titles-string "tmux:#I [ #W ]"
