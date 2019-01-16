#!/bin/bash

while read line
do
	echo "File:$line"
	clsbdh=`echo ${line} | awk '{split($0,a,",");print a[1]}'`
	clpp=`echo ${line} | awk '{split($0,a,",");print a[2]}'`
	chys=`echo ${line} | awk '{split($0,a,",");print a[3]}'`

	

		if [ ! -d ./picture/$clpp ]; then
			mkdir -p ./picture/$clpp

		if [ ! -d ./picture2/$chys ]; then
			mkdir -p ./picture2/$chys
					
		cp ./tianjin_photo/*_${clsbdh}_01.jpg ./picture/$clpp/
		cp ./tianjin_photo/*_${clsbdh}_01.jpg ./picture2/$chys/
		
done < clsbdh.txt

echo "done!"

