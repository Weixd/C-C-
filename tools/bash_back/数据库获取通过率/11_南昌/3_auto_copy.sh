#!/bin/bash

mkdir 0112_error
while read line
do
    echo "File:$line"
#    scp "public@192.168.204.61:${line}" ./0157_error
    cp $line ./0112_error	
done < nan_chang_0112_image_list.txt


mkdir 0201_error
while read line
do
    echo "File:$line"
    cp $line ./0201_error
done < nan_chang_0201_image_list.txt


mkdir 0203_error
while read line
do
    echo "File:$line"
    cp $line ./0203_error
done < nan_chang_0203_image_list.txt


mkdir 0321_error
while read line
do
    echo "File:$line"
    cp $line ./0321_error
done < nan_chang_0321_image_list.txt


mkdir 0322_error
while read line
do
    echo "File:$line"
    cp $line ./0322_error
done < nan_chang_0322_image_list.txt


mkdir 0351_error
while read line
do
    echo "File:$line"
    cp $line ./0351_error
done < nan_chang_0351_image_list.txt


