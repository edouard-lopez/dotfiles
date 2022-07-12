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

# Based on thibault-ketterer solution https://gist.github.com/josh-padnick/c90183be3d0e1feb89afd7573505cab3
function sshagent_findsockets
    find /tmp -uid (id -u) -type s -name agent.\* 2>/dev/null
end

function sshagent_testsocket
    if [ ! -x (command which ssh-add) ]
        echo "ssh-add is not available; agent testing aborted"
        return 1
    end

    if [ X"$argv[1]" != X ]
        set -xg SSH_AUTH_SOCK $argv[1]
    end

    if [ X"$SSH_AUTH_SOCK" = X ]
        return 2
    end

    if [ -S $SSH_AUTH_SOCK ]
        ssh-add -l >/dev/null
        if [ $status = 2 ]
            echo "Socket $SSH_AUTH_SOCK is dead!  Deleting!"
            rm -f $SSH_AUTH_SOCK
            return 4
        else
            # echo "Found ssh-agent $SSH_AUTH_SOCK"
            return 0
        end
    else
        echo "$SSH_AUTH_SOCK is not a socket!"
        return 3
    end
end


function ssh_agent_init
    # ssh agent sockets can be attached to a ssh daemon process or an
    # ssh-agent process.

    set -l AGENTFOUND 0

    # Attempt to find and use the ssh-agent in the current environment
    if sshagent_testsocket
        set AGENTFOUND 1
    end

    # If there is no agent in the environment, search /tmp for
    # possible agents to reuse before starting a fresh ssh-agent
    # process.
    if [ $AGENTFOUND = 0 ]
        for agentsocket in (sshagent_findsockets)
            if [ $AGENTFOUND != 0 ]
                break
            end
            if sshagent_testsocket $agentsocket
                set AGENTFOUND 1
            end

        end
    end

    # If at this point we still haven't located an agent, it's time to
    # start a new one
    if [ $AGENTFOUND = 0 ]
        # echo "Need to start a new agent"
        eval (ssh-agent -c)
        set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
        set -Ux SSH_AGENT_PID $SSH_AGENT_PID
    end

    # Finally, show what keys are currently in the agent
    # ssh-add -l
end

ssh_agent_init
# End Based on thibault-ketterer 
