#!/bin/sh

webm="-threads 16 -map 0 -c:v libvpx -qmin 0 -qmax 50 -crf 5 -b:v 5M -c:a libvorbis -c:s webvtt -f webm"

ffmpeg -i $1 \
  $webm -vf scale=-2:1080 $2-1080.webm \
  $webm -vf scale=-2:720 $2-720.webm \
  $webm -vf scale=-2:640 $2-640.webm \
  $webm -vf scale=-2:320 $2-320.webm