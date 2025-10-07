#!/bin/bash

read -p "Please provide me a number and I will tell you is even or odd:" number

if (($number % 2 == 0))
then
	echo "Haha, it is an even number"
else
	echo "Wuwu, it is an odd number"
fi
