function today
    printf "%s" (string lower (date '+%Y-%m-%d')) | xclip -selection clipboard
end
