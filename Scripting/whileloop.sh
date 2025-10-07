#!/bin/bash
count=1
i="Current Count"
while [ $count -le 5 ] #when count is less than or equal to 5
	do
		echo "$i:$count"
		count=$((count+1)) #increment the counter
	done

echo "Loop finished"

