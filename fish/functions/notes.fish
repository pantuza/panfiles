function notes --description "Controls my persnal Notes file"

    # Default path of Notes file
    set --local DEFAULT_NOTES_FILE "$HOME/.config/panfiles/notes"

    if not set --query NOTES_FILE
        # Default path of Notes file
        set NOTES_FILE $DEFAULT_NOTES_FILE
    end

    switch "$argv"

    case -e --edit
        vim $NOTES_FILE

    case -s --show
        cat $NOTES_FILE
        cat $NOTES_FILE | xclip -selection clipboard

    case '*'
        echo "Invalid option: $argv"
        echo "Usage: notes -e|--edit"
        echo "Usage: notes -s|--show"
        return 1
    end
end
