#!/usr/bin/env bash
# delete every folder one by one
# find . -type f > files
# split -l 1000 files files. 
for F in files.* do 
    cat $F | xargs echo 
done