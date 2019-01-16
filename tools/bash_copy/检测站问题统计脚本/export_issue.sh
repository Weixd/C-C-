#!/bin/bash

date1='2018-12-03'
date2='2018-12-04'
for cate in '0111' '0112' '0113' '0157' '0158' '0201' '0202' '0203' '0204' '0205' '0209' '0321' '0352' '0322' '0348' '0351' '0344' '0323'	
do

	mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "select hphm, DATE(created_at), device_id, jyjgbh from car_schema.vehicle_checks where id in (SELECT vehicle_check_id FROM car_schema.check_infos where created_at>'$date1' and  created_at<'$date2'and category ='$cate' and result='5')">>$cate.csv
	echo "dump OK!!!!!!!!!!!!!!"

	while read line
	do
		echo "File:$line"
		hphm=`echo ${line} | awk '{split($0,a," ");print a[1]}'`
		created_at=`echo ${line} | awk '{split($0,a," ");print a[2]}'`
		device_id=`echo ${line} | awk '{split($0,a," ");print a[3]}'`
		jyjgbh=`echo ${line} | awk '{split($0,a," ");print a[4]}'`

	
		cj_code=($cate)

		for code in ${cj_code[@]}
		do
			if [ ! -d ./$cate/$jyjgbh/$code ]; then
				mkdir -p ./$cate/$jyjgbh/$code
			fi

			 
			if [ $device_id = "0" ]; then
		        	cp /opt/vehicle/vehicle_photo/${created_at}/${code}_${hphm}_* ./$cate/${jyjgbh}/${code}/
			else
		        	uu="public"
			        base=$(echo "180+$device_id"|bc)
			        pp="192.168.100.$base"
		        	scp ${uu}@${pp}:/opt/vehicle/vehicle_photo/${created_at}/${code}_${hphm}_* ./$cate/${jyjgbh}/${code}/
			fi
		done
	done < $cate.csv

	echo "copy done!!!!!!!!"
done
echo "finish !!!!!!!!!!!!!!"	

