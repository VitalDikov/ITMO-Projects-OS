#!/bin/bash
declare -a arr
cap=0
rm report2.log
while [[ true ]]; do
	arr+=(1 2 3 4 5 6 7 8 9 10)
	let cap++
	if [[ $cap == 10000 ]];	then 
		cap=0
		echo ${#arr[@]} >> report2.log
	fi
done

echo "Я выполнился удачно)))0)"
