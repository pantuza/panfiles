
function video-webcam --description "Open Webcam using MPlayer"

    set --local argc (count $argv)

    if test $argc -eq 1
        mplayer tv:// -tv driver=v4l2:device=$argv[1]
    else
        echo "Usage: video-webcam webcam_device_file"
        echo "Example: video-webcam /dev/video0"
    end
end
