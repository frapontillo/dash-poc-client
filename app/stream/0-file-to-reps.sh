#!/bin/sh

ffmpeg -i sintel.mkv \
  -strict -2 -c:v libx264 -vf "scale=1080:trunc(ow/a/2)*2" -c:a aac -f mp4 sintel-1080p.mp4 \
  -strict -2 -c:v libvpx -vf "scale=1080:trunc(ow/a/2)*2" -c:a libvorbis -f mp4 sintel-1080p.webm \
  -strict -2 -c:v libx264 -vf "scale=720:trunc(ow/a/2)*2" -c:a aac -f mp4 sintel-720p.mp4 \
  -strict -2 -c:v libvpx -vf "scale=720:trunc(ow/a/2)*2" -c:a libvorbis -f mp4 sintel-720p.webm \
  -strict -2 -c:v libx264 -vf "scale=640:trunc(ow/a/2)*2" -c:a aac -f mp4 sintel-640p.mp4 \
  -strict -2 -c:v libvpx -vf "scale=640:trunc(ow/a/2)*2" -c:a libvorbis -f mp4 sintel-640p.webm \
  -strict -2 -c:v libx264 -vf "scale=320:trunc(ow/a/2)*2" -c:a aac -f mp4 sintel-320p.mp4 \
  -strict -2 -c:v libvpx -vf "scale=320:trunc(ow/a/2)*2" -c:a libvorbis -f mp4 sintel-320p.webm