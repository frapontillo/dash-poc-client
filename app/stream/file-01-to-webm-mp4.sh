#!/bin/sh

mp4="-threads 16 -strict -2 -c:v libx264 -c:a aac -f mp4"
webm="-threads 16 -map 0 -c:v libvpx -qmin 0 -qmax 50 -crf 5 -b:v 5M -c:a libvorbis -c:s webvtt -f webm"
conf1080="-vf scale=-2:1080"
conf720="-vf scale=-2:720"
conf640="-vf scale=-2:640"
conf320="-vf scale=-2:320"

ffmpeg -i $1 -y \
  $mp4 $conf1080 $2-1080.mp4 \
  $mp4 $conf1080 $2-1080.webm \
  $mp4 $conf720 $2-720.mp4 \
  $mp4 $conf720 $2-720.webm \
  $mp4 $conf640 $2-640.mp4 \
  $mp4 $conf640 $2-640.webm \
  $mp4 $conf320 $2-320.mp4 \
  $mp4 $conf320 $2-320.webm
