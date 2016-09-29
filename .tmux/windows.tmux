# WINDOWS & PANES
# Set scrollback to 10,000 lines with
set -g history-limit 10000
setw -g aggressive-resize on

# set first window to index 1 (not 0) to map more to the keyboard layout...
set -g base-index 1
setw -g pane-base-index 1
# confirm before killing a window or the server
bind-key q killp
bind-key k confirm kill-window
bind-key K confirm kill-server

# Automatic layouting: https://wiki.archlinux.org/index.php/Tmux#Automatic_layouting
bind -n M-c kill-pane \; select-layout
bind -n M-n split-window \; select-layout

# Redefine splitting shortcut
unbind %
bind | split-window -h -c '#{pane_current_path}'
unbind '"'
bind - split-window -v -c '#{pane_current_path}'

# Firefox-like shortcuts for tabs
# ctrl-t opens new window
bind-key -n C-t new-window -c '#{pane_current_path}'
# ctrl+left/right cycles thru windows
bind-key -n C-PPage previous-window
bind-key -n C-NPage next-window
# Tab Navigation using Alt+#
unbind M-0
bind-key -n M-0   select-window -t :0
unbind M-0
bind-key -n M-1   select-window -t :1
unbind M-0
bind-key -n M-2   select-window -t :2
unbind M-0
bind-key -n M-3   select-window -t :3
unbind M-0
bind-key -n M-4   select-window -t :4
unbind M-0
bind-key -n M-5   select-window -t :5
unbind M-0
bind-key -n M-6   select-window -t :6
unbind M-0
bind-key -n M-7   select-window -t :7
unbind M-0
bind-key -n M-8   select-window -t :8
unbind M-0
bind-key -n M-9   select-window -t :9

# Pane switching with Alt+arrow
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D