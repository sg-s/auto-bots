#!/bin/bash
# MakeRetina.sh
# converts all images in the given folder to retina size (2880x1800px)
# % 
# % created by Srinivas Gorur-Shandilya at 10:20 , 09 April 2014. Contact me at http://srinivas.gs/contact/
# % 
# % This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License. 
# % To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/.


# specify minimum size
MinWidth=2880
MinHeight=1800

# specify image formats
formats[1]="jpg"
formats[2]="jpeg"
formats[3]="tiff"
formats[4]="png"

# iterate over all conditions
n=${#formats[@]}

for (( c=1; c<=$n; c++ ))
do 
	this_format=${formats[$c]}
	strip-spaces $this_format

	for a in *$this_format; do 
		echo $a
		# figure out if the width needs to be enlarged
		w=$(sips -g pixelWidth $a | grep pixelWidth | cut -c15-)	
		if [ $w -lt $MinWidth ]
		then
			echo "Increasing to meet minimum width..."
			sips --resampleWidth $MinWidth $a
		fi

		# figure out if the height needs to be enlarged
		h=$(sips -g pixelHeight $a | grep pixelHeight | cut -c15-) 
		if [ $h -lt 1880 ]
		then
			echo "Increasing to meet minimum width..."
			sips --resampleHeight $MinHeight $a
		fi
		
		# move this file to ~/Pictures/wallpapers/retina/
		mv $a ~/Pictures/wallpapers/retina/$a

	done
done


echo "DONE"