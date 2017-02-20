
function fs-disks-list --description "List all disks using fdisk"

    sudo fdisk --list --color=always
end


function fs-mount-list --description "List all mount points using df"

    df -h
end


function fs-dir-size --description "Displays the directory size with depth 1"

    set --local argc (count $argv)

    if test $argc -eq 1
        du -hc -d 1 $argv[1]
    else
        echo "Usage: fs-dir-size /path/to/directory"
        echo "Example: fs-dir-size /home/pantuza"
    end
end
