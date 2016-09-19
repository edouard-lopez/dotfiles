

function utilities
    function up
       cd .. $argv;
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

    # Use the google API to translate text
    # @param    $1|$text               text to translate
    # @param    $2|$sourceLang   text to translate
    # @param    $3|$targetLang    text to translate
    # @reutrn    string
    function translate
        set text "$argv[1]"
        set sourceLang "$argv[2]"; or set sourceLang "en"
        set targetLang "$argv[3]"; or set targetLang "fr-FR"
        set apiQueryString (printf "client=t&text=%s&hl=en&sl=%s&tl=%s&ie=UTF-8&oe=UTF-8&multires=1&prev=btn&ssel=0&tsel=0&sc=1" "$text" "$sourceLang" "$targetLang")
        set url "http://translate.google.com/translate_a/t?$apiQueryString"
        set raw (curl -A "Mozilla\/5.0" \'"$url"\')

        echo "$raw"
    end

    function tree
       command tree --charset utf-8 $argv;
    end

    # We just want to view content with pager (default: less)
    function v
       $PAGER $argv;
    end
end
configure
