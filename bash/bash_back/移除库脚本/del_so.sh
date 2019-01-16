#!/bin/bash

while read line
do
	echo "File:$line"
	name=`echo ${line} | awk '{split($0,a,"/");print a[5]}'`
	mv ./${name} ../
	echo "delete ${name}"
	
	

		
done < gun.txt

echo "done!"

