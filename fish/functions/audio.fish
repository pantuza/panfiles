function audio-to-video --description "Converts an audio file into a video with frequency espectrum"

    set --local argc (count $argv)

    if test $argc -eq 1
        set --local input $argv[1]
        set --local output (path change-extension '' $input).mp4

        echo ">>> Converting '$input' to '$output'"
        ffmpeg -hide_banner -n -i "$input" -filter_complex "[0:a]showcqt=axis=0,format=yuv420p[v]" -map "[v]" -map 0:a "$output" < /dev/null
                      
    else
        echo "Usage: audio-to-video audio_input_file"
        echo "Example: audio-to-video some-content.mp3"
        echo "It will generate the output file with the same name and mp4 extension"
    end
end