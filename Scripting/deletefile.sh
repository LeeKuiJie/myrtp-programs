#!/bin/bash

read -p "Please enter the file name:" myfile

if [ -e $myfile ];
then
	rm -r "$myfile"
	echo "$myfile deleted,gg"
else
	echo "File not found, Please try again"
fi

