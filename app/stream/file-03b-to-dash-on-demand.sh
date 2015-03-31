#!bin/sh

packager "input=$1-1080.ts,stream=video,output=$2-1080.mp4" \
	"input=$1-720.ts,stream=video,output=$2-720.mp4" \
	"input=$1-640.ts,stream=video,output=$2-640.mp4" \
	"input=$1-320.ts,stream=video,output=$2-320.mp4" \
	"input=$1-1080.ts,stream=audio,output=$2-audio.mp4" \
	--profile on-demand \
	--mpd_output $2.mpd
