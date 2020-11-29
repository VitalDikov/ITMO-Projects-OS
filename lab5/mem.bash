#!/bin/bash
declare -a arr
cap=0
rm report.log
while [[ true ]]; do
	arr+=(1 2)
	let cap++
	if [[ $cap == 10000 ]];	then 
		cap=0
		echo ${#arr[@]} >> report.log
	fi
done
