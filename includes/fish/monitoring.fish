function configure
    # List n-application using most space
    # @param    $1|size  number of biggest application to list
    # @return    void
    function du-app
        size="${1:-10}"
        dpkg-query --show --showformat='${Package;-50}\t${Installed-Size}\n' \
        | sort -k 2 -n \
        | grep -v deinstall \
        | awk '{printf "%.1f MB \t %s\n", $2/(1024), $1}' \
        | tail -n "$size"
    end

    # human-readable sizes
    function df
       command df --human-readable --print-type $argv | grep -v tmpfs;
    end

     # show sizes in MB
    function free
       command free -m;
    end

    function psgrep
        ps aux | grep -i $argv[1] | grep -v grep
    end
end
configure
