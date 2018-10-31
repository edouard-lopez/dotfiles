# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

# Other examples:
set -g @plugin 'tmux-plugins/tmux-net-speed'
# set -g @plugin 'tmux-plugins/tmux-sidebar'
# set -g @plugin 'tmux-plugins/tmux-resurrect'
# set -g @plugin 'tmux-plugins/tmux-continuum'
# set -g @plugin 'tmux-plugins/tmux-yank'
set -g @plugin 'tmux-plugins/tmux-battery'

# Install: Hit prefix + I to fetch the plugin and source it.
run '~/.tmux/plugins/tpm/tpm'