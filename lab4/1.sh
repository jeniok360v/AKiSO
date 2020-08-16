#!/bin/bash


tput civis
recieve_arr=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
recieve_curr=( 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)

recieve=$(awk '$1=="enp0s3:"{ print($2) }' /proc/net/dev)
for (( i=0;i<"${#recieve_arr[@]}";i++ ))
do
	recieve_arr[$i]=$recieve
done

transmit_arr=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
transmit_curr=( 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)

transmit=$(awk '$1=="enp0s3:"{ print($10) }' /proc/net/dev)
for (( i=0;i<"${#transmit_arr[@]}";i++ ))
do
	transmit_arr[$i]=$transmit
done

tput sc

while sleep 1
do

	capacity=$(grep 'CAPACITY=' /sys/class/power_supply/BAT0/uevent | awk -F'=' '{print $2}')
	recieve=$(awk '$1=="enp0s3:"{ print($2) }' /proc/net/dev)
	transmit=$(awk '$1=="enp0s3:"{ print($10) }' /proc/net/dev)
	float_uptime=$(awk '{ print($1) }' /proc/uptime)
	uptime=${float_uptime%.*}
	days=$((uptime/86400))
	hours=$((uptime/3600 - 24*days))
	minutes=$((uptime/60 - 60*hours - 1440*days))
	seconds=$((uptime - 60*minutes - 3600*hours - 86400*days))
	loadavg=$(awk '{print($1,$2,$3)}' /proc/loadavg)

	arecieve=$((recieve/uptime))
	atransmit=$((transmit/uptime))

	tput cup 1 0
	tput setaf 1
	echo "Battery level: $capacity%"
	tput sgr0

	echo "uptime:"
	echo "$days days  "
	echo "$hours hours "
	echo "$minutes minutes "
	echo "$seconds seconds "

	tput cup 2 15
	echo "cpu load: $loadavg"

	tput cup 3 15
	if [ $arecieve -gt 1048576 ]
	then
		arecieve=$((arecieve/1048576))
		echo "Average recieve: $arecieve MB       "
	elif [ $arecieve -gt 1024 ]
	then
		arecieve=$((arecieve/1024))
		echo "Average recieve: $arecieve KB       "
	else
		echo "Average recieve: $arecieve B       "
	fi

	tput cup 4 15
	if [ $atransmit -lt 1024 ]
	then
		echo "Average transmit: $atransmit B      "
	elif [ $atransmit -lt 1048576 ]
	then
		atransmit=$((atransmit/1024))
		echo "Average transmit: $atransmit KB     "
	else
		atransmit=$((atransmit/1048576))
		echo "Average transmit: $atransmit MB     "
	fi
	

	#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
	#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
	#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
	#~~~~~~~~~~~~~RECIEVE GRAPH~~~~~~~~~~~~~#
	#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
	#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
	#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
	for (( i=1;i<"${#recieve_arr[@]}";i++ ))
	do
		recieve_arr[$i-1]="${recieve_arr[i]}"
	done
	recieve_arr[-1]=$recieve

	for (( i=0;i<"${#recieve_arr[@]}";i++ ))
	do
	   recieve_curr[i]=$(( ${recieve_arr[i]}-${recieve_arr[i-1]} ))
	done

	recieve_max=0
	for i in "${recieve_curr[@]}"
	do
		((i > recieve_max)) && recieve_max=$i
	done

	for (( i=0;i<"${#recieve_curr[@]}";i++ ))
	do
		for (( k=10;k>0;k-- ))
		do
			tput cup $((21-k)) $((5+i))
			if [ $((recieve_max*k)) -lt $((recieve_curr[i]*10))  ]
			then
				tput setaf 2
				echo "*"
			else
				tput setaf 1
				echo "."
			fi
		done
	done
	tput sgr0

	tput cup 9 5
	if [ $((recieve_curr[-1])) -gt 1048576 ]
	then
		mx=$((recieve_curr[-1]/1048576))
		echo "Current recieve: $mx MB       "
	elif [ $((recieve_curr[-1])) -gt 1024 ]
	then
		mx=$((recieve_curr[-1]/1024))
		echo "Current recieve: $mx KB       "
	else
		echo "Current recieve: ${recieve_curr[-1]} B       "
	fi

	tput cup 10 5
	if [ $recieve_max -gt 1048576 ]
	then
		mx=$((recieve_max/1048576))
		echo "Max on graph: $mx MB       "
	elif [ $recieve_max -gt 1024 ]
	then
		mx=$((recieve_max/1024))
		echo "Max on graph: $mx KB       "
	else
		echo "Max on graph: $recieve_max B       "
	fi


	#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
	#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
	#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
	#~~~~~~~~~~~~~TRANSMIT GRAPH~~~~~~~~~~~~~#
	#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
	#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
	#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
	for (( i=1;i<"${#transmit_arr[@]}";i++ ))
	do
		transmit_arr[$i-1]="${transmit_arr[i]}"
	done
	transmit_arr[-1]=$transmit

	for (( i=0;i<"${#transmit_arr[@]}";i++ ))
	do
	   transmit_curr[i]=$(( ${transmit_arr[i]}-${transmit_arr[i-1]} ))
	done

	transmit_max=0
	for i in "${transmit_curr[@]}"
	do
		((i > transmit_max)) && transmit_max=$i
	done

	for (( i=0;i<"${#transmit_curr[@]}";i++ ))
	do
		for (( k=10;k>0;k-- ))
		do
			tput cup $((21-k)) $((32+i))
			if [ $((transmit_max*k)) -lt $((transmit_curr[i]*10))  ]
			then
				tput setaf 2
				echo "*"
			else
				tput setaf 1
				echo "."
			fi
		done
	done
	tput sgr0

	tput cup 9 32
	if [ $((transmit_curr[-1])) -gt 1048576 ]
	then
		mx=$((transmit_curr[-1]/1048576))
		echo "Current transmit: $mx MB       "
	elif [ $((transmit_curr[-1])) -gt 1024 ]
	then
		mx=$((transmit_curr[-1]/1024))
		echo "Current transmit: $mx KB       "
	else
		echo "Current transmit: ${transmit_curr[-1]} B       "
	fi	

	tput cup 10 32
	if [ $transmit_max -gt 1048576 ]
	then
		mx=$((transmit_max/1048576))
		echo "Max on graph: $mx MB       "
	elif [ $transmit_max -gt 1024 ]
	then
		mx=$((transmit_max/1024))
		echo "Max on graph: $mx KB       "
	else
		echo "Max on graph: $transmit_max B       "
	fi
	

	tput cup 22 0
	
done

#tput cnorm