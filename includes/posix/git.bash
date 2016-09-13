#!/usr/bin/env bash

function git() {
    # GITHUB
    # Create a repo on github and connect it to local repo
    # @param    $1|$project  project name
    # @param    $2|server  remote server
    # @param    $3|$user  remote user account
    # @return    void
    function github-new() {
        local project="${1:-git-$RANDOM}"
        local server="${2:-github.com}"
        local user="${3:-edouard-lopez}"

        # create directory if missing
        [[ "$(basename "$(pwd)")" != "$project" ]] && mkdir "$project"

        # connnect to remote repo
        git remote add origin https://"$server"/"$user"/"$project".git

        # pull README and stuff like that
        git pull origin master
        # push local files
        git push origin master
    }

    # Add existing remote branch to the remote 'all' so you can:
    #  git push all
    # @return    void
    function git-add-to-push-all() {
        # Fields are: 'name', 'url' and 'method'
        while read -r name url method; do
            printf "Adding remote: %s (%s, %s)\n" "$name" "$url" "$method"
            git config --add remote.all.url "$url"
        done < <(git remote -v | awk '!/^all/ && /push/')
    }

    # Pull and track all remote branches
    function git-pull-all() {
        while read -r branch; do
            printf "Pulling remote: %s\n" "$branch"
            git branch --track "${branch#remotes/origin/}" "$branch"
        done < <(git branch -a | grep remotes | grep -v HEAD | grep -v master)
    }
}
configure
