#!/bin/bash
# shows the name of the computer in an interesting font using figlet
cn=$(uname -n | cut -d'.' -f1)

# specify which figlet fonts to use
font[1]="cybermedium"
font[2]="thin"
font[3]="stop"
font[4]="banner3"
font[5]="doom"
font[6]="larry3d"
font[7]="isometric1"
font[8]="isometric2"
font[9]="isometric3"
font[10]="isometric4"
font[11]="stellar"
font[12]="small"
font[13]="puffy"
font[14]="poison"
font[15]="epic"

# find out how many fonts we have to choose from 
n=${#font[@]}

# pick a random font
r=$RANDOM
r=$(( r %= $n ))
r=$((r+1))

# show the font
figlet -f "${font[$r]}" $cn
