#!/bin/sh

ffmpeg -loglevel info -i rtsp://root:pass@192.168.100.138/mpeg4/media.amp \
	-an -c:v libx264 -s 640x480 -b:v 1024k -r 30 -f mpegts udp://127.0.0.1:5001 \
	-an -c:v libx264 -s 320x240 -b:v 1024k -r 30 -f mpegts udp://127.0.0.1:5002 \
	-an -c:v libx264 -s 640x480 -b:v 512k -r 30 -f mpegts udp://127.0.0.1:5003 \
	-an -c:v libx264 -s 320x240 -b:v 512k -r 30 -f mpegts udp://127.0.0.1:5004 \
	-vn -strict -2 -ac 2 -c:a aac -b:a 64k -f mpegts udp://127.0.0.1:5005 \
	-vn -strict -2 -ac 2 -c:a aac -b:a 32k -f mpegts udp://127.0.0.1:5006
