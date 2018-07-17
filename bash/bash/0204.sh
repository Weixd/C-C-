#!/bin/bash

date1="20080509"
date2="20080410"

t1=`date -d "$date1" +%s`
t2=`date -d "$date2" +%s`

if [ $t1 -gt $t2 ]; then
	echo "$date1 > $date2"
elif [ $t1 -eq $t2 ]; then
	echo "$date1 == $date2"
else
	echo "$date1 < $date2"
fi

for ff in `ls -d 2018-05-* | xargs -l basename`
do 
	if [ -d ${ff} ]; then
		echo ${ff}	
		cd ${ff}
		
		for code in  "0203" #"0202" "0204" "0206" "0212" "0213" "0258"
		do
			for pp in `find -type f -name "${code}_*" | xargs -l basename`
			do
				cp ${pp} ../pic${code}/${pp}.jpg
			done 
		done
		
		cd ..
	fi
done



