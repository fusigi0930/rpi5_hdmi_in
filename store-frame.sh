#!/bin/bash
#
FILE="/run/user/1000/${1:-tmp.jpg}"

fswebcam -r 1920x1080 -p UYVY -F1 -S1 $FILE --no-banner --no-title
