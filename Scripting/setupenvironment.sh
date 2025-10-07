#!/bin/bash

set -e

BASE_DIR="MyChip"

DIRS=(
	"$BASE_DIR/Model/bin"
	"$BASE_DIR/Model/RTL"
	"$BASE_DIR/Testsource/Blackbox"
	"$BASE_DIR/Testsource/Whitebox"
	"$BASE_DIR/Regression/080925/Passed"
	"$BASE_DIR/Regression/080925/Failed"
	"$BASE_DIR/Regression/090325"
	"$BASE_DIR/Regression/090025"
)

echo "The directories for $BASE_DIR are creating, please wait..." 

for item  in "${DIRS[@]}"; 
do 
	if [ ! -d "$item" ];
	then
		mkdir -p "$item"
		echo " The subdirectory is created: $(basename "$item")"
	else
		echo " The subdirectory already existed, Please double check: $(basename "$item")"
	fi
done


echo "All the directories for $BASE_DIR have been set up"
