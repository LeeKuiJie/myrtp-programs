#!/bin/bash

read -p "Come, enter a number:" number

sum=0

for ((i=1;i<=$number;i++))
do
	sum=$((sum+i))
done

echo "The sum from 1 to $number is: $sum"
