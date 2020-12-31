function up --argument-names repeat
    set --query repeat; or set --local repeat 1

    for i in (seq 1 $repeat)
       cd ..;
    end
end
function back
   cd - $argv;
end


function decrypt
   gpg --decrypt $argv;
end

# Open given file with adequate rights (sudo/user)
# @param    $@|$file  file(s) name
# @return    void
function e
    set file "$argv[1]"

    if test -w "$file"
        eval $EDITOR -- "$file"
    else if test ! -a "$file"
        touch "$file"
        eval $EDITOR -- "$file"
    else
        sudo -e -- "$file"
    end
end

# ex - archive extractor
# usage: ex <file>
function ex
    if test -f "$argv[1]"
        switch $argv[1]
            case *.tar.bz2;     tar xjf "$argv[1]";
            case *.tar.gz;      tar xzf "$argv[1]";
            case *.bz2;         bunzip2 "$argv[1]";
            case *.rar;         unrar x "$argv[1]";
            case *.gz;          gunzip "$argv[1]";
            case *.tar;         tar xf "$argv[1]";
            case *.tbz2;        tar xjf "$argv[1]";
            case *.tgz;         tar xzf "$argv[1]";
            case *.zip;         unzip "$argv[1]";
            case *.Z;           uncompress "$argv[1]";
            case *.7z;          7z x "$argv[1]";
            case *.tar.xz;      tar xJf "$argv[1]";
            case *;             echo "'$argv[1]' cannot be extracted via ex()";
        end
    else
        echo "'$argv[1]' is not a valid file"
    end
end

# Return HTTP status code matching pattern
# @return   string
function htc
    env GREP_COLORS="sl=01;34:ms=01;32" grep -i "$argv" "$HOME"/.http-cheatsheet.md
end

# image viewer
function i
   feh $argv;
end

# Filter given pass by given string
# @param    $1|path  path to list
# @param    $2|filter  string used to filter directory listing
# @return    string
function ls-grep
    set dir "$argv[1]"
    set filter "$argv[2]"
    ls -lah "$dir/$filter"
end

# A quicker Mkdir
# @param    $1|directory  directory create and switch to
# @return    void
# @author:   Shrayas Rajagopal
# @see: https://coderwall.com/p/p1sd5a
function md
   mkdir "$argv[1]"; and cd "$argv[1]";
end

function meteo
    curl wttr.in/$argv
end

function pdf2djvu-ocr
   $HOME/projects/pdf2djvu-ocr/pdf2djvu-ocr.sh $argv;
end

function tree
   command tree --charset utf-8 $argv;
end

# We just want to view content with pager (default: less)
function v
   eval $PAGER $argv;
end

thefuck --alias | source 