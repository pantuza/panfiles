
function log-history-grep --description "Greps the history log for word"

    set --local argc (count $argv)

    if test $argc -eq 1
        history | grep -i $argv[1]
    else
        history
    end
end
