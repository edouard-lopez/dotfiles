# Display date H:M (mon-day) for a list of predefined timezone
# list of timezone available in: /usr/share/zoneinfo/
#
# @return string
function worldtime
    set locations "America/New_York" "Asia/Kolkata" "Europe/Paris"
    for location in locations;
    do
        set time (env TZ=$location date '+%H:%M (%b-%d)')
        printf "%s: %s\n" (echo $location|cut -d '/' -f1) $time
    end
end

function today
    printf "%s" (to-lower (date '+%Y-%m-%d')) | xclip -selection clipboard
end
function now
    to-lower (date '+%Y-%b-%d-%H:%M')
end