function todo --description "Controls my persnal TODO list"

    # Default path of TODO file
    set --local DEFAULT_TODO_FILE "$HOME/.local/panfiles/todo"

    if not set --query TODO_FILE
        # Default path of TODO file
        set TODO_FILE $DEFAULT_TODO_FILE
    end

    switch "$argv"

    case -e --edit
        vim $TODO_FILE

    case -s --show
        cat $TODO_FILE
        cat $TODO_FILE | xclip -selection clipboard

    case '*'
        echo "Invalid option: $argv"
        echo "Usage: todo -e|--edit"
        echo "Usage: todo -s|--show"
        return 1
    end
end

