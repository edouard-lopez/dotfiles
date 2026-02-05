function debug_fish \
    --argument-name name

    set fish_trace 1
    source $__fish_config_dir/functions/$name.fish
    $name
    set fish_trace 0
end
