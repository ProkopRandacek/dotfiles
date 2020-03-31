function rr
    if test "$argv" = ""
        eval command $history[1] -rf
    else
        command rm $argv -rf
    end
end
