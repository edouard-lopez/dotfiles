if status is-interactive
    eval "$(keychain add --quiet --eval $KEYCHAIN_KEYS)"
else if status is-login
    eval "$(keychain add --quiet --eval --noask)"
end