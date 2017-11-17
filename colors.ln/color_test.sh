#!/bin/sh
function colorgrid( )
{
	iter=16
	while [ $iter -lt 52 ]
	do
		second=$[$iter+36]
		third=$[$second+36]
		four=$[$third+36]
		five=$[$four+36]
		six=$[$five+36]
		seven=$[$six+36]
		if [ $seven -gt 250 ];then seven=$[$seven-251]; fi

		printf  "\033[38;5;$(echo $iter)m█ "
		printf "%03d" $iter
		printf  "   \033[38;5;$(echo $second)m█ "
		printf "%03d" $second
		printf  "   \033[38;5;$(echo $third)m█ "
		printf "%03d" $third
		printf  "   \033[38;5;$(echo $four)m█ "
		printf "%03d" $four
		printf  "   \033[38;5;$(echo $five)m█ "
		printf "%03d" $five
		printf  "   \033[38;5;$(echo $six)m█ "
		printf "%03d" $six
		printf  "   \033[38;5;$(echo $seven)m█ "
		printf "%03d" $seven

		iter=$[$iter+1]
		printf '\r\n'
	done
}


function get_color()
{
	declare -a list=("160" "196" "202" "208"  "215" "221"  "226" "227" "190" "154" "118" "82" "46")
	if [ -z $1 ]
	then
		echo "0"
	else
		if [ "$1" -eq "$1" ] 2>&-
		then
			index=$(expr $1 % ${#list[@]})
			echo "${list[$index]}"
		else
			echo "0"
		fi
	fi
}

function color2( )
{
	# list="196 197 198 199 200 201 204 205 206 207 165 135"
	list="0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30"
	for i in $list
	do
		printf "\033[48;5;$(get_color $i)m    \033[0m%d\n" $(get_color $i)
	done
}
colorgrid

# color2
