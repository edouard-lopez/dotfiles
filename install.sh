#!/usr/bin/env bash
# DESCRIPTION
#	link all config files to the user $HOME directory.
#
# USAGE
#	./home/install.sh
#

scriptDir="$(dirname "$0")"

#printf "repo: %s; cur: %s" "$repoDir" "$curDir"

for f in "$scriptDir"/{*,.*}; do 
	fn="$(basename "$f")"
  	[[ "$fn" == *.git ]] && continue
	[[ "$fn" == install.sh || "$fn" == *.swp ]] && continue # ignore install.sh and *.swp
  	[[ "$fn" == "." || "$fn" == ".." ]] && continue

	nf="$HOME/$fn"
	printf "%s\n" "$f"
	if [[ -f "$nf" || -h "$nf" ]]; then
		# backup existing file
		printf "\tBackup to: %s\n" "$nf".bak
		mv "$nf"{,.bak}
	fi

	if [[ -f "$f" || -h "$f" ]]
	then
		# symlink to file
		printf "\tLinking to: %s\n" "$nf"
		ln -s "$f" "$nf"
	else
		printf "\tOverriding to: %s\n" "$nf"
		cp -R "$f" "$nf"
	fi
done
