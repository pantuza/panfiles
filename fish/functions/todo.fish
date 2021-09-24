function todo --description "Controls my persnal TODO list"

    # Default path of TODO file
    set --local DEFAULT_TODO_FILE "$HOME/.config/panfiles/todo"

    if not set --query TODO_FILE
        # Default path of TODO file
        set TODO_FILE $DEFAULT_TODO_FILE
    end

    switch "$argv"

    case -e --edit
        vim $TODO_FILE

    case -s --show
        cat $TODO_FILE

        if test (uname -s) = "Darwin"
            cat $TODO_FILE | pbcopy
        else
            cat $TODO_FILE | xclip -selection clipboard
        end

    case '*'
        echo "Invalid option: $argv"
        echo "Usage: todo -e|--edit"
        echo "Usage: todo -s|--show"
        return 1
    end
end

