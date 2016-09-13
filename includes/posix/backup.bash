#!/usr/bin/env bash

function configure() {
    # Backup data to external disk using cron tab (added by 'restore')
    # @param: void
    # @return: stdout
    function rsync2external-disk() {
        crontab -l | grep 'rsync' | sed 's!@daily !!' | while read -r cmd; do bash -c "$cmd"; done
    }
}
configure
