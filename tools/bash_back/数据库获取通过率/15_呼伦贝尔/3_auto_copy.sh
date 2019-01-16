#!/bin/bash

count=0
mkdir 0203_error
while read line
do
    echo "file: $line"
    cp $line ./0203_error
    scp "public@15.61.0.101:$line" ./0203_error
    scp "public@15.61.0.102:$line" ./0203_error
    let count++
    echo $count
    if [ $count = 5000 ]
    then
        break
    fi
done < 0203_list.csv
