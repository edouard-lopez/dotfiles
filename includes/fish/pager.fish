# PAGER / LESS
#set --export --universal PAGER most
set EMPTY ""

function less \
    --description "syntax higlighting for the Pager, see http://www.andre-simon.de/" \
    --argument-names file_to_highlight

    if test -n "$file_to_highlight"
        highlight \
            --style base16/ayu-light \
            --out-format=xterm256 \
            --force \
            "$file_to_highlight" \
            | command less -R
    else
        command less -R
    end
end
