#!/bin/bash
trap "tput reset; tput cnorm; exit" 2 #Commands that are called on exit
clear
tput civis #Makes cursor invisible
line=2
col=$(($(tput cols)/2)) #number of columns/2
co=$((col-1)) #col - 1
color=0
tput setaf 2; tput bold #Set color and new characters bold

#Tree
for ((i=0; i<19; i+=2))
{
	tput cup $line $col
	for ((j=0; j<=i; j++))
	{
		echo -n \*
	}
	let line++
	let col--
}

tput sgr0; tput setaf 3 #srg0 makes cursor visible

# Trunk
for ((i=0; i<2; i++))
{
    tput cup $((line++)) $co
    echo 'lOl'
}

new_year=$(date +'%Y')
let new_year++
tput setaf 1; tput bold

tput cup $line $((co - 6)); echo MERRY CHRISTMAS
tput cup $((line + 1)) $((co - 12)); echo  And let $new_year be even better!
tput setaf 4
tput cup $((line + 3)) $((co - 6)); echo By Chris Bernard

let co++
k=1

#Animation
while true; do
	for((i=0; i<35; i++))
	{
		[ $k -gt 1 ] && {
            tput setaf 2; tput bold
            tput cup ${linea[$[k-1]$i]} ${columna[$[k-1]$i]}; echo \*
            unset linea[$[k-1]$i]; unset columna[$[k-1]$i]  
        }

        lin=$((RANDOM % 9 + 3)) #random line
        start=$((co-lin+2)) #bounds for -
        fin=$((co+lin+2))   #the randomness
        cu=$((RANDOM % (lin-2) * 2 + 1 + start)) #random column
        tput setaf $color; tput bold #sets color to $color
        tput cup $lin $cu #moves cursor to line $lin and column cu
        echo o
        linea[$k$i]=$lin
        columna[$k$i]=$cu
        color=$(((color+1)%8))
        sleep 0.01
	}
	k=$((k % 2 + 1))
done