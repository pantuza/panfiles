
function video-webcam --description "Open Webcam using MPlayer"

    set --local argc (count $argv)

    if test $argc -eq 1
        mplayer tv:// -tv driver=v4l2:device=$argv[1]
    else
        echo "Usage: video-webcam webcam_device_file"
        echo "Example: video-webcam /dev/video0"
    end
end


function video-cameracast --description "Record videocast using ffmpeg"

    set --local argc (count $argv)

    if test $argc -eq 1
        ffmpeg \
            -video_size 800x600 \
            -framerate 30 \
            -f video4linux2 \
            -i /dev/video0 \
            -f alsa \
            -ac 2 \
            -i hw:0 \
            -acodec pcm_s16le \
            -vcodec libx264 \
            -qp 0 \
            -preset ultrafast \
            -crf 0 \
            -threads 0 \
            $argv[1]
    else
        echo "Usage: video-cameracast output_file"
        echo "Example: video-cameracast videocast.mkv"
    end
end


function video-screencast --description "Record screencast using ffmpeg"

    set --local argc (count $argv)

    if test $argc -eq 1
        ffmpeg \
            -f x11grab \
            -r 30 \
            -s 1600x900 \
            -i :0.0 \
            -vcodec libx264 \
            -preset ultrafast \
            -crf 0 \
            -threads 0 \
            $argv[1]
    else
        echo "Usage: video-screencast output_file"
        echo "Example: video-screencast screencast.mkv"
    end
end


function video-bind --description "Binds a video with a audio using ffmpeg"

    set --local argc (count $argv)

    if test $argc -eq 3
        ffmpeg \
            -i $argv[1] \
            -i $argv[2] \
            -map 0:0 \
            -map 1:0 \
            -acodec copy \
            -vcodec copy \
            $argv[3]
    else
        echo "Usage: video-bind video_file audio_file resulted_file"
        echo "Example: video-bind video.mkv audio.flac edited.mkv"
    end
end
