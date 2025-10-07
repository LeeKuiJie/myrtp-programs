#!/bin/bash

case ${1,,} in
	xiaoni | yixiu)
		echo "Hello, you are the monk!"
		;;
	xiaofeng | xiaoyu | xiaoxue)
		echo "Hello, you are the green cheek!"
		;;
	doudou)
		echo "You are an African grey!"
		;;
	pikachu)
		echo "You are a cockatail!"
		;;
	*)
		echo "Who are you? Invader?"
esac
