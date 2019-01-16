#!/bin/bash

dateStr=`date +"%Y-%m-%d"`
if [ -n "$1" ]; then
    dateStr="$1"
fi
echo ${dateStr}

# mine
# cd /opt/vehicle/vehicle_photo/
# ./ar.sh ${dateStr}

# slaves
ips=("91" "92" "93" "94" "95" "96" "97")
for iip in ${ips[@]};do

ssh public@172.18.0.${iip} "cd /opt/vehicle/vehicle_photo/; ./ar.sh ${dateStr}"
scp public@172.18.0.${iip}:/opt/vehicle/vehicle_photo/${dateStr}_${iip}.tar /opt/vehicle/vehicle_photo/${dateStr}_${iip}.tar 

done

