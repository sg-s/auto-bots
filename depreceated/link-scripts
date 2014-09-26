#!/bin/bash
# link-scripts.sh
# % 
# % 
# % created by Srinivas Gorur-Shandilya at 10:20 , 09 April 2014. Contact me at http://srinivas.gs/contact/
# % 
# % This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License. 
# % To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/.
this_folder=$(pwd)
for a in *.sh; do 

	# set permissions to run
	echo "Setting permissions for $a"
	chmod a+x $a

	# link to /usr/bin/
	target=$(echo $a | cut -d'.' -f1)
	echo "Linking $target"
	sudo ln -s $this_folder/$a /usr/bin/$target

done