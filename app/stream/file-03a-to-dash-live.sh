#!bin/sh

packager "input=$1-1080.ts,stream=video,init_segment=$2-1080-init.mp4,segment_template=$2-1080-"'$Number$'".mp4" \
	"input=$1-720.ts,stream=video,init_segment=$2-720-init.mp4,segment_template=$2-720-"'$Number$'".mp4" \
	"input=$1-640.ts,stream=video,init_segment=$2-640-init.mp4,segment_template=$2-640-"'$Number$'".mp4" \
	"input=$1-320.ts,stream=video,init_segment=$2-320-init.mp4,segment_template=$2-320-"'$Number$'".mp4" \
	"input=$1-1080.ts,stream=audio,init_segment=$2-audio-init.mp4,segment_template=$2-audio-"'$Number$'".mp4" \
	--segment_duration 1 \
	--profile live \
	--single_segment $false \
	--mpd_output $2.mpd
