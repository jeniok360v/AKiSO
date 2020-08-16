#!/bin/bash

echo "PPID     PID  STATE NAME"
for FILE in /proc/*
do
	if [[ $FILE =~ [0-9] ]]
	then
		dir="$FILE/status"
		pid="${FILE:6: $((${#FILE}-6))}"		#!!!!!
		#pid=$(grep 'Pid:' $dir | awk '{print $2}')
		name=$(grep 'Name:' $dir | awk '{print $2}')
		state=$(grep 'State:' $dir | awk '{print $2}')
		ppid=$(grep 'PPid:' $dir | awk '{print $2}')
		numberdir="$FILE/fd"
		number=$(sudo ls $numberdir | wc -l)		#permission denied

		printf "%6s%7s%4s%5s   %s\n" "$ppid" "$pid" "$state" "$number" "$name"
	fi
done