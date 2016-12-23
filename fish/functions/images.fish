
function convert2gif --description "Convert images to a gif using ImageMagic"

    set --local args_length (count $argv)

    switch (count $argv)
    case 1
        set --local output_file $argv[1]

        convert -delay 100 -loop 0 -fuzz 10% -layers Optimize *.png $output_file

    case 0 '*'
        # Wrong number of arguments. Shows the usage message
        echo "Usage: convert2gif input_files result_file"
        echo "Example: convert2gif *.png result.gif"
    end
end
