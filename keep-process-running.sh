#!/bin/bash
# This neat shell script will make sure that a specified process is always running. if it is not, it will start an app. 
if [ $(ps aux | grep "Quicksilver" | wc -l) -eq 1 ]
then
	open -a "Quicksilver"
fi

if [ $(ps aux | grep "Typinator" | wc -l) -eq 1 ]
then
	open -a "Typinator"
fi

# keep a log of when you last ran
date > /code/auto-bots/keep-process-running.log