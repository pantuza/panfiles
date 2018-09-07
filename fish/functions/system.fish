function sys-screen-size --description "Prints the current screen size"

    xrandr | grep '*' | awk '{print $1}'
end



function disable-screensaver --description "Disables X server locking"
    xset dpms 0 0 0
    xautolock -disable
end



function enable-screensaver --description "Enables X server locking"
    xset dpms 180 300 600
    xautolock -enable
end
