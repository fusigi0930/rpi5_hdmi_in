NODE=${1:-/dev/v4l-subdev2}

v4l2-ctl -d $NODE --list-dv
