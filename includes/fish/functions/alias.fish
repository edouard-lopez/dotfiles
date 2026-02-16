function find
    fdfind $argv
end

function cat
    switch (lsb_release --short -i) # distribution
    case "Fedora"
        bat --theme="Monokai Extended Light" $argv
    case "Ubuntu"
        batcat --theme="Monokai Extended Light" $argv
    end
end

function lechat 
    vibe $argv
end
