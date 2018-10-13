#!/bin/bash
#还可以用pidof命令查看，启动的程序会有pid，否则没有

while true
do
    count=0
    ps aux | grep vin_compare | while read line
    do
        echo $line
        let count+=1
    done

    if (( "$count" <= "1" ))
    then
        echo "start vin_compare"
        ./vin_compare ~/mount_image > log.txt &
    fi

    sleep 1s
done
