#!/usr/bin/env bash

clear

#Get single or double digit number from user

echo -e '\n\t Enter any single or double digit number: '
read getnum

# Evaluate number given by user

if [ $getnum -ge 0 ] && [ $getnum -le 9 ];
then
	echo -e '\n\t'$getnum' is a single digit number\n\n'
elif	[ $getnum -ge 10 ] && [ $getnum -le 99 ];
then
	echo -e '\n\t'$getnum' is a double digit number\n\n'
else
	echo -e '\n\t Invalid Choice\n\n'
fi