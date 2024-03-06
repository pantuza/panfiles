function dedup_path --description 'Remove duplicate entries from $PATH and preserves order'

    set --local new_path

    for path in $PATH
        if not contains $path $new_path
            set new_path $new_path $path
        end
    end

    set --global --export PATH $new_path
end
