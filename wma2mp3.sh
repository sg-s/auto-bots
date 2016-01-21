#!/usr/bin/env bash
# converts (and deletes) all WMA files in the current folder to mp3
# use as follows:
# ./wma2mp3 wma
for file in *$1; do 
    out=${file%.wma}.mp3
    ffmpeg -i "$file" -ab 256k "$out" && rm "$file"
done
