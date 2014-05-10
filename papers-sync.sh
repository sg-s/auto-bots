#!/bin/bash
# this shell script does a 2 way sync to keep papers update on my ipad
computer_folder=/Users/sigbhu/Papers2/Articles/
ipad_folder=/Volumes/TMA-2\ Documents/

rsync -avzru  "$computer_folder" "$ipad_folder"
rsync -avzru  "$ipad_folder" "$computer_folder"