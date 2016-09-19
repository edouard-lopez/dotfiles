function configure
    # GITHUB
    # Create a repo on github and connect it to local repo
    # @param    $1|$project  project name
    # @param    $2|server  remote server
    # @param    $3|$user  remote user account
    # @return    void
    function github-new
        set -l project $argv[1]; or set project "git-$RANDOM"
        set -l server $argv[2]; or set server "github.com"
        set -l user $argv[3]; or set user "edouard-lopez"

        # create directory if missing
        if test (basename (pwd)) != "$project"
            mkdir "$project"
        end

        # connnect to remote repo
        git remote add origin https://"$server"/"$user"/"$project".git

        # pull README and stuff like that
        git pull origin master
        # push local files
        git push origin master
    end

    # Add existing remote branch to the remote 'all' so you can:
    #  git push all
    # @return    void
    function git-add-to-push-all
        # Fields are: 'name', 'url' and 'method'
        while read -r name url method;
            git config --add remote.all.url "$url"
        end < (git remote -v | awk '!/^all/ && /push/' | psub)
    end

    # Pull and track all remote branches
    function git-pull-all
        for branch in (git branch -a | grep remotes | grep -v HEAD | grep -v master | psub);
            set -l remote_branch (echo $branch | sed -e 's!remotes/origin/!!')
            git branch --track $remote_branch "$branch"
        end
    end
end
configure
