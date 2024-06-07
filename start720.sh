BEGIN=$(v4l2-ctl --list-devices | grep rp1-cfe -n | awk -F":" '{print $1}')
END=$(v4l2-ctl --list-devices | grep rpivid -n | awk -F":" '{print $1}')
NODE=$(v4l2-ctl --list-devices | sed -n "${BEGIN},${END}p" | grep media)

v4l2-ctl -d /dev/v4l-subdev2 --set-edid=file=720p60edid --fix-edid-checksums
sleep 2
v4l2-ctl -d /dev/v4l-subdev2 --query-dv-timings
sleep 2
v4l2-ctl -d /dev/v4l-subdev2 --set-dv-bt-timings query
sleep 2
v4l2-ctl -V

# reset links
echo media node: $NODE
media-ctl -d $NODE -r
sleep 1

# set formats
media-ctl -d $NODE -l ''\''csi2'\'':4 -> '\''rp1-cfe-csi2_ch0'\'':0 [1]'
sleep 1
media-ctl -d $NODE --set-v4l2 ''\''tc358743 4-000f'\'':0 [fmt:UYVY8_1X16/1280x720 field:none colorspace:srgb]'
sleep 1
media-ctl -d $NODE -V ''\''csi2'\'':0 [fmt:UYVY8_1X16/1280x720 field:none colorspace:srgb]'
sleep 1
media-ctl -d $NODE -V ''\''csi2'\'':4 [fmt:UYVY8_1X16/1280x7200 field:none colorspace:srgb]'
sleep 1
v4l2-ctl -v width=1280,height=720,pixelformat=UYVY
