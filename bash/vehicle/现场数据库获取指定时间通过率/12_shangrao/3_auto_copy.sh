#!/bin/bash

mkdir 0157_error
while read line
do
    echo "File:$line"
#    scp "public@192.168.204.61:${line}" ./0157_error
    cp $line ./0157_error	
done < shang_rao_0157_image_list.txt

mkdir 0203_error
while read line
do
    echo "File:$line"
    cp $line ./0203_error
done < shang_rao_0203_image_list.txt

mkdir 0204_error
while read line
do
    echo "File:$line"
    cp $line ./0204_error
done < shang_rao_0204_image_list.txt

mkdir 0209_error
while read line
do
    echo "File:$line"
    cp $line ./0209_error
done < shang_rao_0209_image_list.txt

mkdir 0344_error
while read line
do
    echo "File:$line"
    cp $line ./0344_error
done < shang_rao_0344_image_list.txt

mkdir 0348_error
while read line
do
    echo "File:$line"
    cp $line ./0348_error
done < shang_rao_0348_image_list.txt

mkdir 0351_error
while read line
do
    echo "File:$line"
    cp $line ./0351_error
done < shang_rao_0351_image_list.txt


