function sys-screen-size --description "Prints the current screen size"

    xrandr | grep '*' | awk '{print $1}'
end
