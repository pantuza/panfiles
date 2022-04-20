function find-file --description "Finds a regular file inside a given path"

    set --local argc (count $argv)

    if test $argc -eq 1
        find . -type f -iname "$argv[1]"
    else if test $argc -eq 2
        find $argv[1] -type f -iname "$argv[2]"
    else
        echo "Usage: find-file file_name"
        echo "       find-file path_to_find file_name"
    end
end
