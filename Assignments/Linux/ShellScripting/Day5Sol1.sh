#!/usr/bin/env bash
#

# Script to add a user to Linux system
if [ $(id -u) -eq 0 ]; then
    read -p "Enter username : " uName
	# Check if user given username already exist in available system users
	egrep "^$uName" /etc/passwd >/dev/null
	if [ $? -eq 0 ]; then
		echo "$uName exists!"
		exit 1
	else
	    read -s -p "Enter password : " passWd
		pass=$(perl -e 'print crypt($ARGV[0], "password")' $passWd)
		useradd -m -p $pass $uName
		[ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"
	fi
else
	echo "Only root may add a user to the system"
	exit 2
fi

