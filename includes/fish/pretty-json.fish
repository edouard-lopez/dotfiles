function pretty-json
python -m json.tool "$argv[1]" | pygmentize -l javascript | less
end
