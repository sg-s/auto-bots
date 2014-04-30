#!/bin/bash
# This neat shell script runs a app that mounts an network volume when it detects that 
# 1) it is on the correct WiFi and
# 2) the volume is not actually present 
# why do we add this to the path?
# see this:
# http://stackoverflow.com/questions/2388087/how-to-get-cron-to-call-in-the-correct-paths
export PATH=$PATH:/usr/sbin/

if [ $(airport -I | grep "secret_internet" | wc -l) -gt 0 ] && [ $(ls /Volumes/ | grep "Red October" | wc -l) -lt 1 ]
then
	open -n /code/auto-bots/mount_stf.app --args -AppCommandLineArg

fi

env > ~/env_dump.txt