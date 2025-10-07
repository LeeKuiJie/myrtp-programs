#!/bin/bash

read -p "Please enter a number and I am going to check if its off or even: " mynumber
if ((mynumber%2 == 0))
then
	echo "The number is even"
else
	echo "The number is odd haha"
fi
