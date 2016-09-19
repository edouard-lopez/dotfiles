#!/usr/bin/env bash

function configure() {
    # Change case from lower case to upper case
    # @param     $@  String to upper
    # @return    string
    function to-upper() { echo "$@" |tr '[:lower:]' '[:upper:]'; }
    function l2u() { to-upper "$@"; }

    # Change case from upper case to lower case
    # @param     $@  String to lower
    # @return    string
    function to-lower() { echo "$@" |tr '[:upper:]' '[:lower:]' ; }
    function u2l() { to-lower "$@"; }

    # Capitalize a string
    # @param    $@  string to capitalize
    # @return   String
    function capitalize() {
        read -ra words <<< "$@" && echo "${words[@]^}"
    }

    function replace() {
        text="$1"
        sep="${2:- }" # space
        newsep="${3:--}"
        [[ -z "$text" ]] && exit
        echo "${text//$sep/$newsep}"
    }

    function dashify() {
        replaceText "$1" ' ' '-'
    }

    # Description: prepend text to a file
    # param, $1 : text to prepend
    # param, $2 : file to edit
    function prepend() {
        printf '%s\n' H 1i "$1" . w | ed -s "$2"
    }

    # Compare a file computed md5sum against official checksum
    # @param    $1|file  file to checksum
    # @param    $2|controlChecksum  official/valid checksum
    # @return    void
    function md5check() {
        controlChecksum="$2"

        if [[ ! -e "$1" || -z "$2" ]];
            then
            [[ ! -e "$1" ]] && printf "[!] File not found\n"
            [[ -z "$2" ]] && printf "[!] Checksum is empty\n"
            printf "Aborting…\n"
            exit
        fi

        fileChecksum="$(md5sum "$1" | cut -d ' ' -f 1 )"

        if [[ "$fileChecksum" = "$controlChecksum" ]];
            then
            printf "[i] File is valid.\n"
        else
            printf "[!] Checksum does NOT match!\n"
        fi
    }
}
configure
