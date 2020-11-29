#!/bin/bash

declare -a arr
if [[ $# == 0 ]]; then
	N=3200000
else
	N=$1
fi

while [[ true ]]; do
	arr+=(1 2 3 4 5 6 7 8 9 10)
#	echo "${#arr[@]}"
	if (( "${#arr[@]}" >= "$N" ));	then
		exit 0
	fi
done
