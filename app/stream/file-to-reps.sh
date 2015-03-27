#!/bin/sh

mp4="-threads 16 -strict -2 -map 0 -c:v libx264 -c:a aac -c:s copy -f mp4"
webm="-threads 16 -map 0 -c:v libvpx -qmin 0 -qmax 50 -crf 5 -b:v 1M -c:a libvorbis -c:s webvtt -f webm"
  
ffmpeg -i $1 $mp4 -vf scale=-1:1080 $2-1080p.mp4

ffmpeg -i $1 \
  -strict -2 -map 0 -c:v libx264 -vf scale=-1:1080 -c:a aac -c:s copy -f mp4 $2-1080p.mp4 \
  -threads 16 -map 0 -c:v libvpx -vf scale=-1:1080 -qmin 0 -qmax 50 -crf 5 -b:v 1M -c:a libvorbis -c:s webvtt -f webm $2-1080p.webm \
  -strict -2 -map 0 -c:v libx264 -vf scale=-1:720 -c:a aac -c:s copy -f mp4 $2-720p.mp4 \
  -threads 16 -map 0 -c:v libvpx -vf scale=-1:720 -qmin 0 -qmax 50 -crf 5 -b:v 1M -c:a libvorbis -c:s webvtt -f webm $2-720p.webm \
  -strict -2 -map 0 -c:v libx264 -vf scale=-1:640 -c:a aac -c:s copy -f mp4 $2-640p.mp4 \
  -threads 16 -map 0 -c:v libvpx -vf scale=-1:640 -qmin 0 -qmax 50 -crf 5 -b:v 1M -c:a libvorbis -c:s webvtt -f webm $2-640p.webm \
  -strict -2 -map 0 -c:v libx264 -vf scale=-1:320 -c:a aac -c:s copy -f mp4 $2-320p.mp4 \
  -threads 16 -map 0 -c:v libvpx -vf scale=-1:320 -qmin 0 -qmax 50 -crf 5 -b:v 1M -c:a libvorbis -c:s webvtt -f webm $2-320p.webm