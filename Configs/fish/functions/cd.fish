function cd
    if test (count $argv) -gt 0
        builtin cd $argv
        and ls
    else
        builtin cd
    end
end
