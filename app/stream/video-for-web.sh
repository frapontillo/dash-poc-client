#!/bin/sh

mp4="-threads 16 -strict -2 -c:v libx264 -c:a aac -f mp4"
webm="-threads 16 -map 0 -c:v libvpx -qmin 0 -qmax 50 -crf 5 -b:v 1M -c:a libvorbis -c:s webvtt -f webm"

ffmpeg -i $1 \
  $mp4 -vf scale=-2:1080 $2-1080.mp4 \
  $webm -vf scale=-2:1080 $2-1080.webm \
  $mp4 -vf scale=-2:720 $2-720.mp4 \
  $webm -vf scale=-2:720 $2-720.webm \
  $mp4 -vf scale=-2:640 $2-640.mp4 \
  $webm -vf scale=-2:640 $2-640.webm \
  $mp4 -vf scale=-2:320 $2-320.mp4 \
  $webm -vf scale=-2:320 $2-320.webm