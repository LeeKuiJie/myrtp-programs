#!/bin/bash

read -p "Please enter a number:" number

sum=0

for ((i=1; i<=number; i++));
do 
	sum=$((sum+i))
done

echo "The sum of numbers from 1 to %number is: $sum"

