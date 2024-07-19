function ta
    if test -n "$argv[1]"
        tmux attach -t $argv[1]
    else
        tmux attach
    end
end
