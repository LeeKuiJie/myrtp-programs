#!/bin/bash

for file in *.sh
do
	echo "$file : $(wc -l < "$file") lines"
done


