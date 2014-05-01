#!/bin/bash
wifiname=$(airport -I | grep "secret_internet" | wc -l)
STFmounted=$(ls /Volumes/ | grep "Red October" | wc -l)
echo $wifiname
echo $STFmounted

echo $wifiname $STFmounted > /code/auto-bots/test.log