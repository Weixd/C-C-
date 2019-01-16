#!/bin/bash

idx=0
while read line
do
	cc=`echo ${line} | awk '{split($0,a,",");print a[4]}'`
	clsbdh=`echo ${cc} | awk '{split($0,a,"'\''");print a[2]}'`

	vin_1=`echo ${line} | awk '{split($0,a,",");print a[7]}'`
	vin_2=`echo ${line} | awk '{split($0,a,",");print a[10]}'`

	rr=`echo ${line} | awk '{split($0,a,",");print a[11]}'`
	result=`echo ${rr} | awk '{split($0,a,"'\''");print a[2]}'`

	v1=`echo ${vin_1} | awk '{split($0,b,"'\''");print b[2]}'`
	v2=`echo ${vin_2} | awk '{split($0,b,"'\''");print b[2]}'`

	mkdir -p ${result}

	echo ${v1} | xxd -r -p > ./${result}/${clsbdh}_1.jpg
	echo ${v2} | xxd -r -p > ./${result}/${clsbdh}_2.jpg

	echo "${clsbdh} ${result}"
#	echo ${vin_1}
	let idx+=1
#	echo $line > file${idx}
done < VEHICLE_CHECK.sql

