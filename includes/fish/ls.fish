function ls \
    --wraps='exa \
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

    exa \
        --oneline \
        --classify \
        --long \
        --icons \
        --all \
        --group-directories-first $argv
end
