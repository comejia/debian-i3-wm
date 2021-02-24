#!/bin/bash
# Delete local and remote branchs

git pull

for bra in $(git branch --merged);
do
	git branch -d $bra;
done

git remote prune origin
