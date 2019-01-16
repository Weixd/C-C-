#!/bin/bash

while read line
do
	echo "File:$line"
	hphm=`echo ${line} | awk '{split($0,a,",");print a[1]}'`
	created_at=`echo ${line} | awk '{split($0,a,",");print a[2]}'`
	device_id=`echo ${line} | awk '{split($0,a,",");print a[3]}'`
	jyjgbh=`echo ${line} | awk '{split($0,a,",");print a[4]}'`

	
	cj_code=("0202")

	for code in ${cj_code[@]}
	do
		if [ ! -d ./pic/$jyjgbh/$code ]; then
			mkdir -p ./pic/$jyjgbh/$code
		fi

		 
		if [ $device_id = "0" ]; then
                	cp /opt/vehicle/vehicle_photo/${created_at}/${code}_${hphm}_* ./pic/${jyjgbh}/${code}/
        	else
                	uu="public"
	                base=$(echo "$device_id+90"|bc)
        	        pp="172.18.0.$base"
                	scp ${uu}@${pp}:/opt/vehicle/vehicle_photo/${created_at}/${code}_${hphm}_* ./pic/${jyjgbh}/${code}/
        	fi
	done
done < hphm.csv

echo "done!"

