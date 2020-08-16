#!/bin/bash

address=$1

counter=0
cwd=$(pwd)
dir="/home/jeiniok/Uranus/v0.txt"
lynx -dump $1 > $dir
cd "/home/jeiniok/Uranus"
git checkout master
git add v0.txt
git commit -m "Added version0"
git push


while sleep $2
do
	counter=$((counter + 1))

	dir="/home/jeiniok/Uranus/v$counter.txt"
	lynx -dump $1 > $dir
	cd "/home/jeiniok/Uranus/"

	git add "v$counter.txt"
	git commit -m "Added version$counter"
	git push

	differ=$(diff "v$((counter-1)).txt" "v$counter.txt")
	if [ "$differ" == "" ]
	then
		tput setaf 14
		echo "No changes"
		tput sgr0
	else
		tput setaf 10
		echo "$differ"
		tput sgr0
	fi

	rm "/home/jeiniok/Uranus/v$((counter-1)).txt"
	cd "$cwd"
done
