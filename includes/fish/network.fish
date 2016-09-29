function irc
    if type mosh > /dev/null
        mosh "$MY_SERVER" -- tmux attach -t irc
    else
        command ssh "$MY_SERVER" -- '.tmux attach -t irc || .tmux -2 new -s irc'
    end
end

function myip
   wget http://checkip.dyndns.org -O - -o /dev/null | cut -d : -f 2 | cut -d \< -f 1 $argv;
end

function ping
   command ping -c 10 $argv;
end

function ssh
       if type mosh > /dev/null
               mosh $argv; or command ssh $argv
       else
               command ssh $argv
       end
end