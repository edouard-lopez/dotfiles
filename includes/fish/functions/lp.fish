# A sugar function to ease lesspass CLI usage for:
#   * Firefox (lp-fx), 
#   * Bitwarden (lp-bw)
#   * Enterprise (lp-ente),
# copy each password to the clipboard and print the list of services
# Required environment variables:
#   * LESSPASS_LENGTH
#   * LESSPASS_ACCOUNT

function lp \
    --description "Generate and copy passwords for various services"
    set --local missing

    __check_required LESSPASS_LENGTH LESSPASS_ACCOUNT
    read --silent --local --export --prompt-str "Enter password: " password; or return $status
    __verify_fingerprint || return 1

    # clipboard will have them in reverse order
    lp-fx && echo "3: "(set_color cyan)"Firefox"(set_color --reset)
    lp-bw && echo "2: "(set_color cyan)"Bitwarden"(set_color --reset)
    lp-ente && echo "1: "(set_color cyan)"Ente"(set_color --reset)
end

function __check_required \
    --description "Check for required environment variables"

    for required in $argv
        set --query $required || begin

            printf "%s missing %s, set it and try again\n" \
                (set_color --bold --background brred black)" Error "(set_color  --reset) \
                (set_color magenta)$required(set_color --reset)
            set --append missing $required
        end
    end
    if test (count $missing) -gt 0
        return 1
    end
end

function __verify_fingerprint \
    --description "Ask confirmation for the master password fingerprint"

    LESSPASS_MASTER_PASSWORD="$password" lesspass --only-fingerprint
    # default to yes if empty
    read --local --prompt-str "Confirm fingerprint (Y/n): " confirm; or return $status

    if test -z "$confirm" -o "$confirm" = Y -o "$confirm" = y
        printf "%s fingerprint %s\n" \
            (set_color --bold --background brgreen black)" Success "(set_color  --reset) \
            (set_color green)"confirmed 🗸"(set_color --reset)
        return 0
    end
    printf "%s fingerprint %s\n" \
        (set_color --bold --background bryellow black)" Warning "(set_color  --reset) \
        (set_color yellow)"rejected ✗"(set_color --reset)
    return 1
end

function lp-fx
    LESSPASS_MASTER_PASSWORD="$password" lesspass about:logins $LESSPASS_ACCOUNT --length $LESSPASS_LENGTH --copy
end

function lp-bw
    LESSPASS_MASTER_PASSWORD="$password" lesspass vault.bitwarden.com $LESSPASS_ACCOUNT --length $LESSPASS_LENGTH --copy
end

function lp-ente
    LESSPASS_MASTER_PASSWORD="$password" lesspass auth.ente.com $LESSPASS_ACCOUNT --length $LESSPASS_LENGTH --copy
end
