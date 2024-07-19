function tn
    if test -n "$argv[1]"
        tmux new -s $argv[1]
    else
        tmux new -s (basename pwd)
    end
end
