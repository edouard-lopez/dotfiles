function cmd_exists
    type "$1" > /dev/null
end

function psgrep
    ps aux | grep -i $argv[1] | grep -v grep
end

function process_exists
  set -l count (psgrep "$argv[1]" | wc -l)

  if math "$count > 0" > /dev/null
        echo true
    else
        echo false
    end
end
