#!/usr/bin/env bash

clear

#Get the character to be repeated in while loop from user

echo -e '\n\t Enter no of line you want to print *: '
read -r numberOfLines

CHARPATTERN="*"
WS=" "
echo -e '\n\t Enter pattern no: '
read -r patternNumber

case "$patternNumber" in
[1] )
	# Repeat print the user given character using while loop
	lineNumber=0
	while [ "$lineNumber" -lt "$numberOfLines" ]
	do
		numberOfStars=0
		echo
		while [ "$numberOfStars" -le "$lineNumber" ]
		do
			echo -n "$CHARPATTERN "
			(( "numberOfStars += 1" ))
		done
		(( "lineNumber += 1" ))
	done
echo -e '\n'
;;
[2] )

# Repeat print the user given character using for loop
	lineNumber=$numberOfLines
	while [ "$lineNumber" -gt "0" ]
	do
		numberOfStars=$lineNumber
		echo
		while [ "$numberOfStars" -gt "0" ]
		do
			echo -n "$CHARPATTERN "
			(( "numberOfStars -= 1" ))
		done
		(( "lineNumber -= 1" ))
	done
echo
;;
[3] )

	# Repeat print the user given character using while loop
	lineCount=1

	while [ "$lineCount" -le "$numberOfLines" ]
	do
		numberOfWS=$lineCount
		while [ "$numberOfWS" -le "$numberOfLines" ]
		do
			echo -n "$WS"
			(( "numberOfWS += 1" ))
		done
		numberOfStars=$lineCount
		while [ "$numberOfStars" -le $((2 * "$lineCount"  - 1)) ]
		   do
			echo -ne "$CHARPATTERN "
			(( "numberOfStars += 1" ))
		   done
		   echo "$WS"
		(( "lineCount += 1" ))
	done
echo -e '\n'
;;
esac