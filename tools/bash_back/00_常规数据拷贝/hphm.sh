#!/bin/bash

while read line
do
	echo "File:$line"
	hphm=`echo ${line} | awk '{split($0,a,",");print a[1]}'`
	created_at=`echo ${line} | awk '{split($0,a,",");print a[2]}'`
	device_id=`echo ${line} | awk '{split($0,a,",");print a[3]}'`

	if [ $device_id = "0" ]; then
		cp /opt/vehicle/vehicle_photo/${created_at}/0112_${hphm}_* ./pic
		cp /opt/vehicle/vehicle_photo/${created_at}/0158_${hphm}_* ./pic
	else
		uu=""
		pp=""
		if [ $device_id = "1" ]; then 
			uu="public"
			pp="192.168.1.215"
		elif [ $device_id = "2" ]; then 
			uu="public"
			pp="192.168.1.216"
		elif [ $device_id = "3" ]; then 
			uu="public"
			pp="192.168.1.217"
		elif [ $device_id = "4" ]; then 
			uu="publicer"
			pp="192.168.1.218"
		fi
		scp ${uu}@${pp}:/opt/vehicle/vehicle_photo/${created_at}/0112_${hphm}_* ./pic
		scp ${uu}@${pp}:/opt/vehicle/vehicle_photo/${created_at}/0158_${hphm}_* ./pic
	fi
done < hphm.csv

echo "done!"
