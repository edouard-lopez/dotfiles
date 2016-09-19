function configure
    # Backup data to external disk using cron tab (added by 'restore')
    # @param: void
    # @return: stdout
    function rsync2external-disk
        crontab -l | grep 'rsync' | sed 's!@daily !!' | while read -r cmd; bash -c "$cmd"; end
    end
end

configure
