#!/usr/bin/env bash

function configure() {
    function irc() {
        if type mosh &> /dev/null; then
            mosh "$MY_SERVER" -- tmux attach -t irc
        else
            command ssh "$MY_SERVER" -- '.tmux attach -t irc || .tmux -2 new -s irc'
        fi
    }

    function myip() { wget http://checkip.dyndns.org -O - -o /dev/null | cut -d : -f 2 | cut -d \< -f 1 "$@"; }

    function ping() { command ping -c 10 "$@"; }

    function ssh() {
       if type mosh &> /dev/null; then
               mosh "$@" || command ssh "$@"
       else
               command ssh "$@"
       fi
    }

}
configure
