#!/bin/bash

encoding="-c:v libx264 -c:a copy -f mpegts $2"

ffmpeg -i $1-1080.mp4 $encoding-1080.ts
ffmpeg -i $1-720.mp4 $encoding-720.ts
ffmpeg -i $1-640.mp4 $encoding-640.ts
ffmpeg -i $1-320.mp4 $encoding-320.ts
