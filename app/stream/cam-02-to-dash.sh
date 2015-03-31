#!/bin/sh

packager \
	'input=udp://127.0.0.1:5001,stream=video,init_segment=live-video-640x480-1024k.mp4,segment_template=live-video-640x480-1024k-$Number$.mp4' \
	'input=udp://127.0.0.1:5002,stream=video,init_segment=live-video-640x480-512k.mp4,segment_template=live-video-640x480-512k-$Number$.mp4' \
	'input=udp://127.0.0.1:5003,stream=video,init_segment=live-video-320x240-1024k.mp4,segment_template=live-video-320x240-1024k-$Number$.mp4' \
	'input=udp://127.0.0.1:5004,stream=video,init_segment=live-video-320x240-512k.mp4,segment_template=live-video-320x240-512k-$Number$.mp4' \
	'input=udp://127.0.0.1:5005,stream=audio,init_segment=live-audio-64k.mp4,segment_template=live-audio-64k-$Number$.mp4' \
	'input=udp://127.0.0.1:5006,stream=audio,init_segment=live-audio-32k.mp4,segment_template=live-audio-32k-$Number$.mp4' \
	--profile live \
	--segment_duration 1 \
	--mpd_output live.mpd
