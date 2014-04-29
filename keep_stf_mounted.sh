#!/bin/bash
# This neat shell script runs a app that mounts an network volume when it detects that 
# 1) it is on the correct WiFi and
# 2) the volume is not actually present 
if [ $(networksetup -getairportnetwork en0 | grep "secret_internet" | wc -l) -eq 1 ]
then
	# we are connected to a wifi network called "secret_internet"
	if [ $(ls /Volumes/ | grep "Red October" | wc -l) -eq 0 ]
	then
		# our network share is not mounted
		open -n ./mount_stf.app --args -AppCommandLineArg
	fi
fi

