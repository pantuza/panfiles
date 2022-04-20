function find-binary --description "Finds a binary file inside a given path"

    set --local argc (count $argv)

    if test $argc -eq 1
        find . -perm -u+x -type f -iname "$argv[1]"
    else if test $argc -eq 2
        find $argv[1] -perm -u+x -type f -iname "$argv[2]"
    else
        echo "Usage: find-binary file_name"
        echo "       find-binary path_to_find file_name"
    end
end
