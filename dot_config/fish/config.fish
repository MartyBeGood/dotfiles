if status is-interactive
    # Commands to run in interactive sessions can go here
    if test -e (which starship)
        starship init fish | source
    end
end
