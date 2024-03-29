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


# Based on thibault-ketterer solution https://gist.github.com/josh-padnick/c90183be3d0e1feb89afd7573505cab3
function sshagent_findsockets
    find /tmp -uid (id -u) -type s -name agent.\* 2>/dev/null
end

function sshagent_testsocket
    set --local ssh_add_bin (/usr/bin/which ssh-add)
    if test ! -x $ssh_add_bin
        echo "ssh-add is not available; agent testing aborted"
        return 1
    end

    if test X"$argv[1]" != X
        set -xg SSH_AUTH_SOCK $argv[1]
    end

    if test X"$SSH_AUTH_SOCK" = X
        return 2
    end

    if test -S $SSH_AUTH_SOCK
        ssh-add -l >/dev/null
        if test $status -eq 2
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
    if test $AGENTFOUND -eq 0
        for agentsocket in (sshagent_findsockets)
            if test $AGENTFOUND -ne 0
                break
            end
            if sshagent_testsocket $agentsocket
                set AGENTFOUND 1
            end

        end
    end

    # If at this point we still haven't located an agent, it's time to
    # start a new one
    if test $AGENTFOUND -eq 0
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
