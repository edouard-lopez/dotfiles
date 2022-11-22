# PAGER / LESS
#set --export --universal PAGER most

function less \
    --description "syntax higlighting for the Pager, see http://www.andre-simon.de/"

    highlight \
        --style base16/one-light \
        --out-format=xterm256 \
        $argv[1] \
    | command less -R
end
