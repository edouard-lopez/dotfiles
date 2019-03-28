#!/usr/bin/env bash

function configure() {
    function up() { cd .. "$@" || exit; }
    function back() { cd - "$@" || exit; }


    function decrypt() { gpg --decrypt "$@"; }

    # Open given file with adequate rights (sudo/user)
    # @param    $@|$file  file(s) name
    # @return    void
    function e() {
        file="$1"

        if [[ -w "$file" ]]; then
            "$EDITOR" -- "$file"
        elif [[ ! -a "$file" ]]; then
            touch "$file"
            "$EDITOR" -- "$file"
        else
            sudo -e -- "$file"
        fi
    }

    # ex - archive extractor
    # usage: ex <file>
    function ex() {
        if [[ -f "$1" ]] ; then
            case $1 in
                *.tar.bz2)   tar xjf "$1"   ;;
                *.tar.gz)    tar xzf "$1"   ;;
                *.bz2)       bunzip2 "$1"   ;;
                *.rar)       unrar x "$1"   ;;
                *.gz)        gunzip "$1"    ;;
                *.tar)       tar xf "$1"    ;;
                *.tbz2)      tar xjf "$1"   ;;
                *.tgz)       tar xzf "$1"   ;;
                *.zip)       unzip "$1"     ;;
                *.Z)         uncompress "$1";;
                *.7z)        7z x "$1"      ;;
                *.tar.xz)    tar xJf "$1"   ;;
                *)           echo "'$1' cannot be extracted via ex()" ;;
            esac
        else
            echo "'$1' is not a valid file"
        fi
    }

    # Return HTTP status code matching pattern
    # @return   string
    function htc(){
        GREP_COLORS="sl=01;34:ms=01;32" grep -i "$*" "$HOME"/.http-cheatsheet.md
    }

    # image viewer
    function i() { feh "$@"; }

    # Filter given pass by given string
    # @param    $1|path  path to list
    # @param    $2|filter  string used to filter directory listing
    # @return    string
    function ls-grep() {
        dir="$1"
        filter="$2"
        ls -lah "$dir/$filter"
    }

    if type md &> /dev/null; then unalias md &> /dev/null; fi
    # A quicker Mkdir
    # @param    $1|directory  directory create and switch to
    # @return    void
    # @author:   Shrayas Rajagopal
    # @see: https://coderwall.com/p/p1sd5a
    function md() { mkdir "$1" && cd "$1" || exit; }

	function meteo() { curl wttr.in/"$@"; }

    function pdf2djvu-ocr() { "$HOME"/projects/pdf2djvu-ocr/pdf2djvu-ocr.sh "$@"; }

    function tree() { command tree --charset utf-8 "$@"; }

    # We just want to view content with pager (default: less)
    function v() { "$PAGER" "$@"; }
}

eval "$(thefuck --alias)"

configure
