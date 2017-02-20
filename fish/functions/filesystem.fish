
function fs-disks-list --description "List all disks using fdisk"

    sudo fdisk --list --color=always
end


function fs-mount-list --description "List all mount points using df"

    df -h
end
