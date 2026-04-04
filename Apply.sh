#!/usr/bin/bash

blacklist=(".git" "$1" "." "..")
for dir in *;do
	blackisted=false
	for item in "${blacklist[@]}";do
		if [ "$item" == "$dir" ];then
			blackisted=true
			break
		fi
	done
	if [ blackisted == true ];then
		continue
	fi
	
	cp -r "$dir" ~/.
done


for dir in .*;do
	blackisted=false
	for item in "${blacklist[@]}";do
		if [ "item" == "$dir" ];then
			blackisted=true
			break
		fi
	done
	if [ blackisted == true ];then
		continue
	fi
	
	cp -r "$dir" ~/.
done
