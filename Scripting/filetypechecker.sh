#!/bin/bash

read -p "Enter filename or directory name: " path

if [ -f "$path" ];
then
	echo "It is a file"
elif [ -d "$path" ];
then 
	echo "It is a directory"
else
	echo "It does not exist."
fi
