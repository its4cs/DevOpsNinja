#!/usr/bin/env bash

clear

#Get the character to be repeated in while loop from user

echo -e '\n\t Enter any charcter you want to print: '
read -r charToRepeat

echo -e '\n\t Enter no of times you want to print '"$charToRepeat"': '
read -r numberOfRepeats

# Repeat print the user given character using while loop

LIMIT=0

while [ "$numberOfRepeats" -gt "$LIMIT" ]
do
	echo -e '\t'"$charToRepeat"
	let "numberOfRepeats -= 1"
done