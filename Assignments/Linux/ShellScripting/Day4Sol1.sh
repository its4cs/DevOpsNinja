#!/usr/bin/env bash

clear

#Get the character to be repeated in for loop from user

echo -e '\n\t Enter no of line you want to print *: '
read -r numberOfLines

CHARPATTERN="*"
WS=" "
echo -e '\n\t Enter pattern no: '
read -r patternNumber

case "$patternNumber" in
[1] )
	# Repeat print the user given character using for loop
	for ((lineNumber=1; lineNumber<=numberOfLines; lineNumber++))
	do
		echo
		for ((numberOfStars=1; numberOfStars<=lineNumber ;numberOfStars++))
		do
			echo -n "$CHARPATTERN "
		done
		(( "lineNumber += 1" ))
	done
echo -e '\n'
;;
[2] )

# Repeat print the user given character using for loop
	for ((lineNumber=$numberOfLines; lineNumber>0; lineNumber--))
	do
		echo
		for ((numberOfStars=$lineNumber; numberOfStars>0; numberOfStars--))
		do
			echo -n "$CHARPATTERN "
		done
	done
echo
;;
[3] )

	# Repeat print the user given character using for loop

	for ((lineCount=1; lineCount <= $numberOfLines; lineCount++))
	do
		for ((numberOfWS=$lineCount; numberOfWS <= $numberOfLines; numberOfWS++))
		do
			echo -n "$WS"
		done
		for ((numberOfStars=$lineCount; numberOfStars <= $((2 * "$lineCount"  - 1)); numberOfStars++))
		   do
			echo -ne "$CHARPATTERN "
		   done
		   echo "$WS"
	done
echo -e '\n'
;;
esac


