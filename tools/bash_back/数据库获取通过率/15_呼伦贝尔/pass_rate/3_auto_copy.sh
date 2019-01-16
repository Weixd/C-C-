#!/bin/bash

count=0
mkdir 0201_error
while read line
do
    echo "File:$line"
    cp $line ./0201_error
    scp "public@15.61.0.101:$line" ./0201_error
    scp "public@15.61.0.102:$line" ./0201_error
    let count++
    echo $count
    if [ $count = 300 ]
    then
        break
    fi
done < hu_lun_bei_er_0201_image_list.txt


count=0
mkdir 0202_error
while read line
do
    echo "File:$line"
    cp $line ./0202_error
    scp "public@15.61.0.101:$line" ./0202_error
    scp "public@15.61.0.102:$line" ./0202_error
    let count++
    echo $count
    if [ $count = 300 ]
    then
        break
    fi
done < hu_lun_bei_er_0202_image_list.txt


count=0
mkdir 0203_error
while read line
do
    echo "File:$line"
    cp $line ./0203_error
    scp "public@15.61.0.101:$line" ./0203_error
    scp "public@15.61.0.102:$line" ./0203_error
    let count++
    echo $count
    if [ $count = 300 ]
    then
        break
    fi
done < hu_lun_bei_er_0203_image_list.txt


count=0
mkdir 0204_error
while read line
do
    echo "File:$line"
    cp $line ./0204_error
    scp "public@15.61.0.101:$line" ./0204_error
    scp "public@15.61.0.102:$line" ./0204_error
    let count++
    echo $count
    if [ $count = 300 ]
    then
        break
    fi
done < hu_lun_bei_er_0204_image_list.txt


count=0
mkdir 0205_error
while read line
do
    echo "File:$line"
    cp $line ./0205_error
    scp "public@15.61.0.101:$line" ./0205_error
    scp "public@15.61.0.102:$line" ./0205_error
    let count++
    echo $count
    if [ $count = 300 ]
    then
        break
    fi
done < hu_lun_bei_er_0205_image_list.txt


count=0
mkdir 0206_error
while read line
do
    echo "File:$line"
    cp $line ./0206_error
    scp "public@15.61.0.101:$line" ./0206_error
    scp "public@15.61.0.102:$line" ./0206_error
    let count++
    echo $count
    if [ $count = 300 ]
    then
        break
    fi
done < hu_lun_bei_er_0206_image_list.txt


count=0
mkdir 0209_error
while read line
do
    echo "File:$line"
    cp $line ./0209_error
    scp "public@15.61.0.101:$line" ./0209_error
    scp "public@15.61.0.102:$line" ./0209_error
    let count++
    echo $count
    if [ $count = 300 ]
    then
        break
    fi
done < hu_lun_bei_er_0209_image_list.txt



