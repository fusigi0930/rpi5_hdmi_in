RES=${1:-1080}

if [ "$RES" == "720" ]; then
#	gst-launch-1.0 -vvv -e v4l2src ! video/x-raw,width=1280,height=720,framerate=60/1,format=UYVY ! videoconvert ! x264enc bitrate=5000 ! h264parse ! kmssink
#
	ffplay -video_size 1280x720 -pixel_format uyvy422 /dev/video0
else
        #gst-launch-1.0 -vvv v4l2src device=/dev/video0 ! video/x-raw,width=1920,height=1080,framerate=30/1,format=UYVY ! queue 
	ffplay -video_size 1920x1080 -pixel_format uyvy422 -framerate 25  /dev/video0
fi

#gst-launch-1.0 -vvv v4l2src device=/dev/video0 ! video/x-raw,width=1280,height=720,format=UYVY,framerate=30/1 ! kmssink

