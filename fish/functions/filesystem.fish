
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

function fs-copy --description "Copies a source directory into target directory using rsync"

    set --local argc (count $argv)

    if test $argc -eq 2
        rsync --verbose --archive --human-readable --progress $argv[1] $argv[2]
    else
        echo "Usage: fs-copy <source> <target>"
        echo "Example: fs-copy /mnt/backup/something /home/pantuza"
    end
end
