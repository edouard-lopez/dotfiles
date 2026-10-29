function _tinty_watch_theme --on-event fish_prompt
    set -l theme_file "$HOME/.local/share/tinted-theming/tinty/tinted-shell-scripts-file.sh"
    sh "$theme_file"
end
