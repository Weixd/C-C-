#!/bin/bash

#for day in "06" "07" "08" "09"
#do
#./sync.sh 2018-06-${day}
#done

#for day in $(seq 10 29)
#do
#./sync.sh 2018-07-${day}
#done

for day in $(seq 7 8)
do
./sync.sh 2018-07-0${day}
done

exit


for day in "91" "92" "93" "94" "95" "96" "97"
do
#./ar.sh 2018-06-${day}
scp ./ar.sh public@172.18.0.${day}:/opt/vehicle/vehicle_photo/ar.sh
done 
