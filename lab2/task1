#!/bin/bash
processes=$(ps -u root | tail -n +2 | awk '{print $1, $4}')
count=$(echo "$processes" | wc -l)
echo "$processes" > file.out
echo "Amount of processes $count" >> file.out
