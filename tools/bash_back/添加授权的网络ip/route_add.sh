#!/bin/bash


while read line
do

    echo "line:  $line"
    echo "emdata#2018" | sudo -S route add $line gw 192.168.200.193 dev enp4s0

done < ip_list.txt
