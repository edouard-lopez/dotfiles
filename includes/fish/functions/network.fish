function irc
    if type --query mosh
        mosh "$MY_SERVER" -- tmux attach -t irc
    else
        command ssh "$MY_SERVER" -- '.tmux attach -t irc || .tmux -2 new -s irc'
    end
end

function ping
    command ping -c 10 $argv
end

function ssh
    if type --query mosh
        mosh $argv; or command ssh $argv
    else
        command ssh $argv
    end
end
