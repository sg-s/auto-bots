#!/bin/bash
# converts raw videos to MJPG in a ts container.
# usage: convert FORMAT_FROM CODEC CONTAINER EXT
# explanatin:
#
# FORMAT_FROM: what format are the videos you want to convert in?
# what extension do they have? if you want to convert all videos in
# the current directory with a .mp4 extension, use "mp4"
# 
# CODEC: the new video codec. It can be one of mp4v (MPEG4), 
# mpgv (MPEG1), DIV1, DIV2, DIV3 (DivX 1,2,3), H263 (H263), 
# I263 (H263I), WMV1 or WMV2 (Windows Media Video 1 or 2), MJPG (MJPEG), MJPB (MJPEGB).
# 
# CONTAINER: which muxer (ie, which container) will be used for the video track. 
# It can be one of avi (for AVI format), ogg (for OGG format), 
# ps (for MPEG2-PS format), ts (for MPEG2-TS format).
# 
# EXT
# what extension do you want your converted video to have?
# 
# example use:
# to convert all .mp4 videos in the current directory to DIVX3 video in a avi container,
# and to give it the extension .video, use:
# ./convert.sh mp4 DIV3 avi video

# remove spaces from all names
for a in *$1; do 
  echo Converting "$a" to "${a// /_}"
  mv "$a" "${a// /_}"
done


# where is VLC?
vlc="/Applications/VLC.app/Contents/MacOS/VLC"

for a in *$1; do 
	# $vlc -I dummy -vvv "$a" --sout "#transcode{hq,deinterlace,vcodec=$2,width=$w,height=$h,vb=$bitrate,channels=6}:standard{mux_video=$3,dst=\"$a.$4\",access=file}" vlc://quit 

	/Applications/VLC.app/Contents/MacOS/VLC -I dummy "$a" --sout "#transcode{acodec=mp3,vcodec=dummy}:standard{access=file,mux=raw,dst=\"$a.mp3\"}" 

	
done
vlc://quit



