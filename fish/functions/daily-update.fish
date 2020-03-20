function daily-update --description "Edit or print Scrum daily update file"

    if not set --query DAILY_UPDATE_FILE
        echo "Missing DAILY_UPDATE_FILE variable. Export it with the path to your daily update file path"
        return 1
    end

    switch "$argv"

    case -e --edit
        vim $DAILY_UPDATE_FILE

    case -s --show
        cat $DAILY_UPDATE_FILE
        cat $DAILY_UPDATE_FILE | xclip -selection clipboard

    case '*'
        echo "Invalid option: $argv"
        echo "Usage: daily-update -e|--edit"
        echo "Usage: daily-update -s|--show"
        return 2
    end
end

