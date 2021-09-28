#!/bin/bash
# gets all the remotes of a git repo
# and pushes to all of them

remote_names=($(git remote))
for i in "${remote_names[@]}"
do
	echo "Pushing to" $i
	git push $i
done