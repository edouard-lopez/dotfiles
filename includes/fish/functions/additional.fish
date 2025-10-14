set files ''  # rc files to load
for file in $files
    set filerc $HOME/.{$file}rc
    if test -f "$filerc"; or test -h "$filerc"
        source "$filerc"
    end
end