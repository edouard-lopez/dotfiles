# make ctrl-arrow, etc. work
set-window-option -g xterm-keys on

# Setting the correct term
set -g default-terminal "screen-256color"

# Allow mouse interaction
bind m set-option mouse
# page Up/Down directly and enable copy mode
bind-key -T root PPage if-shell -F "#{alternate_on}" "send-keys PPage" "copy-mode -e; send-keys PPage"
bind-key -T root NPage if-shell -F "#{alternate_on}" "send-keys NPage" "copy-mode -e; send-keys NPage"

set -g utf8 on

# Activity Monitoring:  get notified when something happens inside other windows
set -g visual-activity off
set-window-option -g monitor-activity on