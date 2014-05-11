#!/bin/bash
# This neat shell script runs a app that mounts an network volume when it detects that 
# 1) it is on the correct WiFi and
# 2) the volume is not actually present 
# why do we add this to the path?
# see this:
# http://stackoverflow.com/questions/2388087/how-to-get-cron-to-call-in-the-correct-paths
export PATH=/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:

# WARNING: NEEDS BASH V4, READ
# https://gist.github.com/samnang/1759336

# tell the script which Wifi networks will activate which drives
wifi[1]="secret_internet"
wifi[2]="YaleSecure"
# you can add as many variables as you want to this array; just make sure you match it with drive_mounted and mount_script

# If you're on this Wifi, tell it which drive should be mounted
drive_mounted[1]="Red October"
drive_mounted[2]="emonetlab"

# tell it which script to run
mount_script[1]="mount-stf.scpt"
mount_script[2]="mount-newton.scpt"


# iterate over all conditions
n=${#wifi[@]}

for (( c=1; c<=$n; c++ ))
do 
	this_wifi=$(airport -I | grep "${wifi[$c]}" | wc -l)
	is_drive_mounted=$(ls /Volumes/ | grep "${drive_mounted[$c]}" | wc -l)


	if [ $this_wifi -gt 0 ] && [ $is_drive_mounted -lt 1 ]
	then
		osascript /code/auto-bots/${mount_script[$c]}
	fi

done




# # keep a log of when you last ran and other things
# date >> /code/auto-bots/keep_stf_mounted.txt
# echo  $wifiname $STFmounted $AttemptMount >> /code/auto-bots/keep_stf_mounted.txt