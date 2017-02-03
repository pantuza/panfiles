
function convert2gif --description "Convert images to a gif using ImageMagic"

    set --local args_length (count $argv)

    switch ($args_length)
    case 1
        set --local output_file $argv[1]

        convert -delay 200 -loop 0 -fuzz 10% -layers Optimize *.png $output_file

    case 0 '*'
        # Wrong number of arguments. Shows the usage message
        echo "Usage: convert2gif result_file"
        echo "Example: convert2gif result.gif"
    end
end
