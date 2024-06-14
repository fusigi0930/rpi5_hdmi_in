EDID_FILE=${1:-1080p60edid}

v4l2-ctl -d /dev/v4l-subdev2 --set-edid=file=$EDID_FILE
