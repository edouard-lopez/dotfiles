#!/usr/bin/env bash

function configure() {
    # Display date H:M (mon-day) for a list of predefined timezone
    # list of timezone available in: /usr/share/zoneinfo/
    #
    # @return string
    function world-time() {
        locations=( "America/New_York" "Asia/Kolkata" "Europe/Paris" )
        for location in "${locations[@]}";
        do
            time=$(TZ="$location" date '+%H:%M (%b-%d)')
            printf "%s: %s\n" "${location##*/}" "$time"
        done
    }

    function today() {
        to-lower "$(date '+%Y-%m-%d')"
    }
    function now() {
        to-lower "$(date '+%Y-%b-%d-%H:%M')"
    }
}
configure
