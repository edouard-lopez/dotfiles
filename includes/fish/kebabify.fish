function kebabify \
    --description 'for git branches' \
    --argument-names text \

    string lower (string replace --all --regex "['\s\(\):#\?]+" "-" "$text")
end
