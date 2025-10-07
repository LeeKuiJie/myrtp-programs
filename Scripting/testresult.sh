#!/bin/bash

set -e
regression=$1
Pass="/home/kjlee_t@oppstar.local/Desktop/haha/MyChip/Regression/080925/Passed"
Fail="/home/kjlee_t@oppstar.local/Desktop/haha/MyChip/Regression/080925/Failed"
Processed_file=true

for result in "$regression"/*.out; 
do
	echo "Checking for $result"
	Processed_file=false
	[ -e "$result" ] || continue

	if grep -i -q "Test Final result: Success" "$result";then
		mv "$result" "$Pass/"
		echo "$(basename "$result") has been moved under passed directory"

	elif grep -i -q "Test Final result: Failed" "$result"; then
		Error_type=$(grep -i "Error" "$result" | head -n1 | grep -o -E 'Error[0-9]+')

		mkdir -p "$Fail/$Error_type"
		mv "$result" "$Fail/$Error_type/"
		echo "$(basename "$result") has been moved under failed directory, specifically under $Error_type"
	
	else
		echo "Failed to find any Pass/Fail status in $(basename "$result"), will skip."
	fi
done

if [[ $Processed_file == true ]];then
	echo "There is no file to be sorted, Please check again!"
else
	echo "All the files have been sorted accordingly"
fi

