#!/bin/bash
# This neat shell script runs a app that mounts an network volume when it detects that 
# 1) it is on the correct WiFi and
# 2) the volume is not actually present 
# why do we add this to the path?
# see this:
# http://stackoverflow.com/questions/2388087/how-to-get-cron-to-call-in-the-correct-paths
export PATH=/usr/local/bin:/bin:/usr/sbin

wifiname=$(airport -I | grep "secret_internet" | wc -l)
STFmounted=$(ls /Volumes/ | grep "Red October" | wc -l)
# AttemptMount=0

if [ $wifiname -gt 0 ] && [ $STFmounted -lt 1 ]
then
	# AttemptMount=5
	osascript /code/auto-bots/mount_stf.scpt
	# AttemptMount=9
fi

# # keep a log of when you last ran and other things
# date >> /code/auto-bots/keep_stf_mounted.txt
# echo  $wifiname $STFmounted $AttemptMount >> /code/auto-bots/keep_stf_mounted.txt