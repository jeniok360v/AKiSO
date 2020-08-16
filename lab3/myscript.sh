#!/bin/bash

for FILE in *
do
	if [ "$FILE" != "${FILE,,}" ]
	then
		NEWFILE="${FILE,,}"
		mv ./"$FILE" ./"$NEWFILE"
	fi

done