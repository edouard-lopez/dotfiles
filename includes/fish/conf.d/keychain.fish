set KEYCHAIN_KEYS \
    ~/.ssh/id_ed25519 \
    ~/.ssh/id_rsa

if status is-interactive
    eval "$(keychain add --eval $KEYCHAIN_KEYS)"
else if status is-login
    eval "$(keychain add --eval --noask)"
end