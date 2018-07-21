#!/usr/bin/env bash
# DESCRIPTION
#	  link all config files to the user $HOME directory.
#
# USAGE
#	  bash $HOME/dotfiles/install.sh
#

function backup() {
    targetfile="$1"

    if [[ -f "$targetfile" || -h "$targetfile" ]]; then
        printf "\tBackup to: %s\n" "$targetfile".bak
        mv "$targetfile"{,.bak}
    fi
}

function install_fish() {
    sourcefile="$1"
    targetfile="$HOME/.config/fish/config.fish"
    echo "$sourcefile" "$targetfile"

    rm "$targetfile"
    ln -nfs "$sourcefile" "$targetfile"
}

function update() {
    sourcefile="$1"
    targetfile="$2"

	if [[ -f "$sourcefile" || -h "$sourcefile" ]]; then
        # symlink to file
        printf "\tLinking to: %s\n" "$targetfile"
        ln -nfs "$sourcefile" "$targetfile"
	else
        printf "\tOverriding to: %s\n" "$targetfile"
        rsync --recursive --exclude '.git' "$sourcefile" "${targetfile%/*}"
	fi
}

function install() {
    scriptDir="$1"

    for sourcefile in "$scriptDir"/{*,.*}; do
        filename="$(basename "$sourcefile")"
        [[ "$filename" == *.git ]] && continue
        [[ "$filename" == install.sh || "$filename" == *.swp ]] && continue # ignore install.sh and *.swp
        [[ "$filename" == "." || "$filename" == ".." ]] && continue
        [[ "$filename" == "config.fish" ]] && install_fish "$sourcefile"

        targetfile="$HOME/$filename"
        printf "%s\n" "$sourcefile"
        backup "$targetfile"
        update "$sourcefile" "$targetfile"
    done
}

scriptDir="$(dirname "$0")"
install "$scriptDir"
