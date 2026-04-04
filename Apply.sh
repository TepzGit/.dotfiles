#!/usr/bin/bash

blacklist=(".git" "$1")
for dir in *;do
	blackisted=false
	for item in "${blacklist[@]}";do
		if [ "item" == dir ];then
			continue
		fi
	done
	
	cp -r $dir ~/.
done
