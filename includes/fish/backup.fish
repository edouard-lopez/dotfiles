# Backup data to external disk using cron tab (added by 'restore')
# @param: void
# @return: stdout
function rsync2external-disk
    #    crontab -l | grep 'rsync' | sed 's!@daily !!' | while read -r cmd; bash -c "$cmd"; end
    rsync -r -t -p -o -g -v --progress --size-only -u -l -H -s /data/Pictures /media/ed8/ed-big5/data-backup/
    rsync -r -t -p -o -g -v --progress --size-only -u -l -H -s /data/paperwork /media/ed8/ed-big5/data-backup/
end
