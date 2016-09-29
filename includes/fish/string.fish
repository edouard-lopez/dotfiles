# Change case from lower case to upper case
# @param     $@  String to upper
# @return    string
function to-upper
   echo $argv |tr '[:lower:]' '[:upper:]';
end

# Change case from upper case to lower case
# @param     $@  String to lower
# @return    string
function to-lower
   echo $argv |tr '[:upper:]' '[:lower:]' ;
end

# Capitalize a string
# @param    $@  string to capitalize
# @return   String
function capitalize
    set input "$argv"
    echo "$input" | sed 's/[^ _-]*/\u&/g'
end

function replace
    set text "$argv[1]"
    set sep "$argv[2]"; or set sep " " # space
    set newsep "$argv[2]"; or set newsep "-" # dash

    echo "$text" | sed -e "s/$sep/$newsep/g"
end

function dashify
    replaceText "$argv[1]" ' ' '-'
end

# Description: prepend text to a file
# param, $1 : text to prepend
# param, $2 : file to edit
function prepend
    printf '%s\n' H 1i "$argv[1]" . w | ed -s "$argv[2]"
end

# Compare a file computed md5sum against official checksum
# @param    $1|file  file to checksum
# @param    $2|controlChecksum  official/valid checksum
# @return    void
function md5check
    set controlChecksum "$argv[2]"

    if test ! -e "$argv[1]"; or test -z "$argv[2]"
        if test ! -e "$argv[1]"; and printf "[!] File not found\n"; end
        if test -z "$argv[2]"; and printf "[!] Checksum is empty\n"; end
        printf "Aborting…\n"
        exit
    end

    set fileChecksum (md5sum "$argv[1]" | cut -d ' ' -f 1 )
    if test "$fileChecksum" = "$controlChecksum"
        printf "[i] File is valid.\n"
    else
        printf "[!] Checksum does NOT match!\n"
    end
end