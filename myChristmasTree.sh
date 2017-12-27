#!/bin/bash
trap "tput reset; tput cnorm; exit" 2 #Commands that are called on exit
clear
tput civis #Makes cursor invisible
line=2
col=$(($(tput cols)/2)) #number of columns/2
co=$((col-1)) #col - 1
c=$((co-2)) #col - 3
color=0
tput setaf 2; tput bold #Set color and new characters bold

#Tree
for ((i=1; i<20; i+=2))
{
	tput cup $line $col
	for ((j=1; j<=i; j++))
	{
		echo -n \*
	}
	let line++
	let col--
}

tput sgr0; tput setaf 3

# Trunk
for ((i=1; i<=2; i++))
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