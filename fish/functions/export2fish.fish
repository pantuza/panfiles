function export2fish --description "Reads from stdin an export statement from bash and exports it to fish"

    while read line
        set --local variable_parts (string split " " $line -f 2)

        set --local key (string split "=" $variable_parts -f 1)
        set --local value (string split "=" $variable_parts -f 2)

        set --global --export $key $value
        echo "exporting $key = $value"
    end
end
