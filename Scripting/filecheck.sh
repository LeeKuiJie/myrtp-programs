#!/bin/bash

read -p "Please enter a filename: " file

if [ -d "$file" ]; then
	echo "File exists."
else
	echo "File does not exist."
fi
