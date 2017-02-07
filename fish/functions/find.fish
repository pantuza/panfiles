
function find-dir --description "Finds a directory inside a given path"

    set --local argc (count $argv)

    if test $argc -eq 1
        find . -type d -iname "$argv[1]"
    else if test $argc -eq 2
        find $argv[1] -type d -iname "$argv[2]"
    else
        echo "Usage: find-dir dir_name"
        echo "       find-dir path_to_find dir_name"
    end
end
