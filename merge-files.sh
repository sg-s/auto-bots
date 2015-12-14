#!/bin/bash

DES_DIR=/Volumes/extra_space/merged-music/
ORI_DIR=/Volumes/extra_space/music/

cd $ORI_DIR
find . -type f  -exec cp {} $DES_DIR \;