#!/usr/bin/env bash

scriptDir="$(dirname "$0")"

#printf "repo: %s; cur: %s" "$repoDir" "$curDir"

for f in "$scriptDir"/{*,.*}; do 
	[[ -f "$f" || -h "$f" ]] || continue # only files or symlinks
	[[ "$f" == *"install.sh" || "$f" == *.swp ]] && continue # ignore install.sh and *.swp

	nf="$HOME/$(basename "$f")"
	if [[ -f "$nf" || -h "$nf" ]]; then
		# backup existing file
		printf "\t%s -> %s\n" "$nf"{,.bak}
		mv "$nf"{,.bak}
	fi

	# symlink to file
	printf "%s -> %s\n" "$f" "$nf"
	ln -s "$f" "$nf"
done
