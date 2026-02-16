function ls \
    --wraps='eza \
  --oneline \
  --classify \
  --long \
  --icons \
  --all \
  --group-directories-first' \
    --description 'alias ls exa \
  --oneline \
  --classify \
  --long \
  --icons \
  --all \
  --group-directories-first'

    eza \
        --oneline \
        --classify \
        --long \
        --icons \
        --all \
        --group-directories-first $argv
end
