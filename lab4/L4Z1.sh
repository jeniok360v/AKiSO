#!/bin/bash

NET1=`cat /proc/net/dev`
NET1=${NET1#*wlp2s0: }
NET1=${NET1%% *}
NETSTART=$NET1
TIMENET=1


function ValinGra {
	Rez=""
	for((i = 0; i < $1; i++)) 
	do
		Rez+='▇'
	done
	echo $Rez
}

function CLR {

	#echo "                                                                                                                 "
	tput el
}

function move1 {

		tput cup $1 10
		echo -en "\033[1@"

		tput cup $1 70
		echo -en "\033[1P"
}

function move2 {

		tput cup $1 85
		echo -en "\033[1@"

		tput cup $1 145
		echo -en "\033[1P"
}

clear
tput sgr0
tput civis


	## MAIN

		tput setaf 7

		tput cup 0 0
		echo "Aktualna i średnia prędkość"

		tput cup 1 25
		echo "Aktualna prędkość"

		tput cup 1 105
		echo "Średnia prędkość"

		tput cup 12 10
		echo "0"

		tput cup 12 23
		echo "15"

		tput cup 12 38
		echo "30"

		tput cup 12 53
		echo "45"

		tput cup 12 68
		echo "60"

		tput cup 12 85
		echo "0"

		tput cup 12 98
		echo "15"

		tput cup 12 113
		echo "30"

		tput cup 12 128
		echo "45"

		tput cup 12 143
		echo "60"

		tput setaf 2

		tput cup 2 0
		echo ">=10 MB/s"
		tput cup 2 10
		echo "····························································"

		tput cup 3 0
		echo "   5 MB/s"
		tput cup 3 10
		echo "····························································"

		tput cup 4 0
		echo "   1 MB/s"
		tput cup 4 10
		echo "····························································"

		tput cup 5 0
		echo " 500 KB/s"
		tput cup 5 10
		echo "····························································"

		tput cup 6 0
		echo " 250 KB/s"
		tput cup 6 10
		echo "····························································"

		tput cup 7 0
		echo "  50 KB/s"
		tput cup 7 10
		echo "····························································"

		tput cup 8 0
		echo "   1 KB/s"
		tput cup 8 10
		echo "····························································"

		tput cup 9 0
		echo " 500  B/s"
		tput cup 9 10
		echo "····························································"

		tput cup 10 0
		echo "  50  B/s"
		tput cup 10 10
		echo "····························································"

		tput cup 11 0
		echo "   1  B/s"
		tput cup 11 10
		echo "····························································"

		tput setaf 1

		tput cup 2 75
		echo ">=10 MB/s"
		tput cup 2 85
		echo "····························································"

		tput cup 3 75
		echo "   5 MB/s"
		tput cup 3 85
		echo "····························································"

		tput cup 4 75
		echo "   1 MB/s"
		tput cup 4 85
		echo "····························································"

		tput cup 5 75
		echo " 500 KB/s"
		tput cup 5 85
		echo "····························································"

		tput cup 6 75
		echo " 250 KB/s"
		tput cup 6 85
		echo "····························································"

		tput cup 7 75
		echo "  50 KB/s"
		tput cup 7 85
		echo "····························································"

		tput cup 8 75
		echo "   1 KB/s"
		tput cup 8 85
		echo "····························································"

		tput cup 9 75
		echo " 500  B/s"
		tput cup 9 85
		echo "····························································"

		tput cup 10 75
		echo "  50  B/s"
		tput cup 10 85
		echo "····························································"

		tput cup 11 75
		echo "   1  B/s"
		tput cup 11 85
		echo "····························································"

		tput setaf 7

		tput cup 14 0
		echo "Time"

		tput cup 20 0
		echo "Aktualny stan baterii"

		tput cup 23 0
		echo "Obciążenie systemy"

		tput cup 24 25
		echo "Obciążenie za 1 min"

		tput cup 24 105
		echo "Obciążenie za 5 min"

		tput cup 30 25
		echo "Obciążenie za 15 min"

		tput cup 30 105
		echo "Aktualny processy"

		tput setaf 6

		tput cup 25 0
		echo "    >30 "
		tput cup 25 10
		echo "····························································"

		tput cup 26 0
		echo "     10 "
		tput cup 26 10
		echo "····························································"

		tput cup 27 0
		echo "      5 "
		tput cup 27 10
		echo "····························································"

		tput cup 28 0
		echo "      2 "
		tput cup 28 10
		echo "····························································"

		tput cup 29 0
		echo "      1 "
		tput cup 29 10
		echo "····························································"



		tput cup 25 75
		echo "    >30 "
		tput cup 25 85
		echo "····························································"

		tput cup 26 75
		echo "     10 "
		tput cup 26 85
		echo "····························································"

		tput cup 27 75
		echo "      5 "
		tput cup 27 85
		echo "····························································"

		tput cup 28 75
		echo "      2 "
		tput cup 28 85
		echo "····························································"

		tput cup 29 75
		echo "      1 "
		tput cup 29 85
		echo "····························································"



		tput cup 31 0
		echo "    >30 "
		tput cup 31 10
		echo "····························································"

		tput cup 32 0
		echo "     10 "
		tput cup 32 10
		echo "····························································"

		tput cup 33 0
		echo "      5 "
		tput cup 33 10
		echo "····························································"

		tput cup 34 0
		echo "      2 "
		tput cup 34 10
		echo "····························································"

		tput cup 35 0
		echo "      1 "
		tput cup 35 10
		echo "····························································"



		tput cup 31 75
		echo "   >100 "
		tput cup 31 85
		echo "····························································"

		tput cup 32 75
		echo "     25 "
		tput cup 32 85
		echo "····························································"

		tput cup 33 75
		echo "      5 "
		tput cup 33 85
		echo "····························································"

		tput cup 34 75
		echo "      2 "
		tput cup 34 85
		echo "····························································"

		tput cup 35 75
		echo "      1 "
		tput cup 35 85
		echo "····························································" 
	##


while true
do

	## NET

		NET=`cat /proc/net/dev`
		NET=${NET#*wlp2s0: }
		NET=${NET%% *}

		NET2=$NET1
		NET1=$NET
		PRA=$(($NET1-$NET2))
		PRSR=$((($NET-$NETSTART)/$TIMENET))
		TIMENET=$(($TIMENET + 1))


		for ((i = 2; i <= 11; i++)) 
		do
			move1 $i
			move2 $i
			case $i in
				2)
					tput setaf 2
					tput cup $i 10
					if (("PRA" >= "10485760"))
					then
						echo "█"
					else 
						echo "·"
					fi
					tput setaf 1
					tput cup $i 85
					if (("PRSR" >= "10485760"))
					then
						echo "█"
					else	
						echo "·"
					fi
				;;
				3)
					tput setaf 2
					tput cup $i 10
					if (("PRA" >= "5242880"))
					then
						echo "█"
					else 
						echo "·"
					fi
					tput setaf 1
					tput cup $i 85
					if (("PRSR" >= "5242880"))
					then
						echo "█"
					else	
						echo "·"
					fi
				;;
				4)
					tput setaf 2
					tput cup $i 10
					if (("PRA" >= "1048576"))
					then
						echo "█"
					else 
						echo "·"
					fi
					tput setaf 1
					tput cup $i 85
					if (("PRSR" >= "1048576"))
					then
						echo "█"
					else	
						echo "·"
					fi
				;;
				5)
					tput setaf 2
					tput cup $i 10
					if (("PRA" >= "512000"))
					then
						echo "█"
					else 
						echo "·"
					fi
					tput setaf 1
					tput cup $i 85
					if (("PRSR" >= "512000"))
					then
						echo "█"
					else	
						echo "·"
					fi
				;;
				6)
					tput setaf 2
					tput cup $i 10
					if (("PRA" >= "256000"))
					then
						echo "█"
					else 
						echo "·"
					fi
					tput setaf 1
					tput cup $i 85
					if (("PRSR" >= "256000"))
					then
						echo "█"
					else	
						echo "·"
					fi
				;;
				7)
					tput setaf 2
					tput cup $i 10
					if (("PRA" >= "51200"))
					then
						echo "█"
					else 
						echo "·"
					fi
					tput setaf 1
					tput cup $i 85
					if (("PRSR" >= "51200"))
					then
						echo "█"
					else	
						echo "·"
					fi
				;;
				8)
					tput setaf 2
					tput cup $i 10
					if (("PRA" >= "1024"))
					then
						echo "█"
					else 
						echo "·"
					fi
					tput setaf 1
					tput cup $i 85
					if (("PRSR" >= "1024"))
					then
						echo "█"
					else	
						echo "·"
					fi
				;;
				9)
					tput setaf 2
					tput cup $i 10
					if (("PRA" >= "500"))
					then
						echo "█"
					else 
						echo "·"
					fi
					tput setaf 1
					tput cup $i 85
					if (("PRSR" >= "500"))
					then
						echo "█"
					else	
						echo "·"
					fi
				;;
				10)
					tput setaf 2
					tput cup $i 10
					if (("PRA" >= "50"))
					then
						echo "█"
					else 
						echo "·"
					fi
					tput setaf 1
					tput cup $i 85
					if (("PRSR" >= "50"))
					then
						echo "█"
					else	
						echo "·"
					fi
				;;
				11)
					tput setaf 2
					tput cup $i 10
					if (("PRA" >= "1"))
					then
						echo "█"
					else 
						echo "·"
					fi
					tput setaf 1
					tput cup $i 85
					if (("PRSR" >= "1"))
					then
						echo "█"
					else	
						echo "·"
					fi				
				;;
			esac 	
		done  
	##

	## time

		T=`cat /proc/uptime`
		S=${T%%.*}
		M=0
		G=0
		D=0

		while (("$S" >= "60"))
		do
			S=$(($S-60))
			M=$(($M+1))
		done

		while (("$M" >= "60"))
		do
			M=$(($M-60))
			G=$(($G+1))
		done

		while (("$G" >= "24"))
		do
			G=$(($G-24))
			D=$(($D+1))
		done

		tput setaf 3

		tput cup 15 0
		if (("$S" == "0")) 
		then
			CLR 
		fi
		echo "Sek: $(ValinGra $S) $S"
		
		tput cup 16 0
		if (("$M" == "0")) 
		then
			CLR 
		fi
		echo "Min: $(ValinGra $M) $M"

		tput cup 17 0
		if (("$G" == "0")) 
		then
			CLR 
		fi
		echo "Gdz: $(ValinGra $G) $G"

		tput cup 18 0
		echo "Dni: $(ValinGra $D) $D"
	##

	## battare	

		BAT=`cat /sys/class/power_supply/BAT0/uevent`
		BAT=${BAT##*POWER_SUPPLY_CAPACITY=}
		BAT=${BAT%%POWER_SUPPLY_CAPACITY_LEVEL*}

		tput setaf 4
		tput cup 21 0
		CLR 
		echo "Stan baterii: $(ValinGra $BAT) $BAT"
	##


	## obciążenie
		
		AVG=`cat /proc/loadavg`
		SRO=${AVG% *}
		SRO=${SRO% *}

		PRC=${AVG#* }
		PRC=${PRC#* }
		PRC=${PRC#* }
		PRC=${PRC% *}

		PRCAKT=${PRC%/*}
		PRCWSZ=${PRC#*/}

		SRO1=${SRO%% *}

		SRO2=${SRO% *}
		SRO2=${SRO2#* }

		SRO3=${SRO##* }

		tput setaf 6

		for ((i = 25; i <= 29; i++)) 
		do
			move1 $i
			move2 $i
			case $i in
				25)
					tput cup $i 10
					if (( $(echo "$SRO1 >= 30" |bc -l) ))
					then
						echo "█"
					else 
						echo "·"
					fi
					tput cup $i 85
					if (( $(echo "$SRO2 >= 30" |bc -l) ))
					then
						echo "█"
					else	
						echo "·"
					fi
				;;
				26)
					tput cup $i 10
					if (( $(echo "$SRO1 >= 10" |bc -l) ))
					then
						echo "█"
					else 
						echo "·"
					fi
					tput cup $i 85
					if (( $(echo "$SRO2 >= 10" |bc -l) ))
					then
						echo "█"
					else	
						echo "·"
					fi
				;;
				27)
					tput cup $i 10
					if (( $(echo "$SRO1 >= 5" |bc -l) ))
					then
						echo "█"
					else 
						echo "·"
					fi
					tput cup $i 85
					if (( $(echo "$SRO2 >= 5" |bc -l) ))
					then
						echo "█"
					else	
						echo "·"
					fi
				;;
				28)
					tput cup $i 10
					if (( $(echo "$SRO1 >= 2" |bc -l) ))
					then
						echo "█"
					else 
						echo "·"
					fi
					tput cup $i 85
					if (( $(echo "$SRO2 >= 2" |bc -l) ))
					then
						echo "█"
					else	
						echo "·"
					fi
				;;
				29)
					tput cup $i 10
					if (( $(echo "$SRO1 >= 1" |bc -l) ))
					then
						echo "█"
					else 
						echo "·"
					fi
					tput cup $i 85
					if (( $(echo "$SRO2 >= 1" |bc -l) ))
					then
						echo "█"
					else	
						echo "·"
					fi
				;;
			esac 	
		done 

		for ((i = 31; i <= 35; i++)) 
		do
			move1 $i
			move2 $i
			case $i in
				31)
					tput cup $i 10
					if (( $(echo "$SRO3 >= 30" |bc -l) ))
					then
						echo "█"
					else 
						echo "·"
					fi
					tput cup $i 85
					if (( $(echo "$PRCAKT >= 100" |bc -l) ))
					then
						echo "█"
					else	
						echo "·"
					fi
				;;
				32)
					tput cup $i 10
					if (( $(echo "$SRO3 >= 10" |bc -l) ))
					then
						echo "█"
					else 
						echo "·"
					fi
					tput cup $i 85
					if (( $(echo "$PRCAKT >= 25" |bc -l) ))
					then
						echo "█"
					else	
						echo "·"
					fi
				;;
				33)
					tput cup $i 10
					if (( $(echo "$SRO3 >= 5" |bc -l) ))
					then
						echo "█"
					else 
						echo "·"
					fi
					tput cup $i 85
					if (( $(echo "$PRCAKT >= 5" |bc -l) ))
					then
						echo "█"
					else	
						echo "·"
					fi
				;;
				34)
					tput cup $i 10
					if (( $(echo "$SRO3 >= 2" |bc -l) ))
					then
						echo "█"
					else 
						echo "·"
					fi
					tput cup $i 85
					if (( $(echo "$PRCAKT >= 2" |bc -l) ))
					then
						echo "█"
					else	
						echo "·"
					fi
				;;
				35)
					tput cup $i 10
					if (( $(echo "$SRO3 >= 1" |bc -l) ))
					then
						echo "█"
					else 
						echo "·"
					fi
					tput cup $i 85
					if (( $(echo "$PRCAKT >= 1" |bc -l) ))
					then
						echo "█"
					else	
						echo "·"
					fi
				;;
			esac 	
		done 

	##

	sleep 1
done



