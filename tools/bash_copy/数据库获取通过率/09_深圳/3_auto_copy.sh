#!/bin/bash

mkdir 0203_error
while read line
do
    echo "File:$line"
#    scp "public@192.168.204.61:${line}" ./0157_error
    cp $line ./0203_error
done < shen_zhen_0203_image_list.txt


mkdir 0322_error
while read line
do
    echo "File:$line"
#    scp "public@192.168.204.61:${line}" ./0157_error
    cp $line ./0322_error	
done < shen_zhen_0322_image_list.txt


mkdir 0351_error
while read line
do
    echo "File:$line"
#    scp "public@192.168.204.61:${line}" ./0157_error
    cp $line ./0351_error	
done < shen_zhen_0351_image_list.txt


mkdir 0344_error
while read line
do
    echo "File:$line"
#    scp "public@192.168.204.61:${line}" ./0157_error
    cp $line ./0344_error	
done < shen_zhen_0344_image_list.txt


mkdir 0323_error
while read line
do
    echo "File:$line"
#    scp "public@192.168.204.61:${line}" ./0157_error
    cp $line ./0323_error	
done < shen_zhen_0323_image_list.txt


