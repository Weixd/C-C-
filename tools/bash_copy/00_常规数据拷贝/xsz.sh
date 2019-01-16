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
		
		for xsz in `find -type f -name "0201_*" | xargs -l basename`
		do
			#set -x
		        #echo ${xsz}	
			fzrq=`echo ${xsz} | awk '{split($0,a,"_");print a[5]}'`

			if [ $fzrq != "None" ]; then
				fzrq=`echo ${fzrq} | awk '{split($0,a,"-");print a[1]}'`

				tnow=`date -d "$fzrq" +%s`
				t1996=`date -d "19960901" +%s`
				t2004=`date -d "20040701" +%s`
				t2008=`date -d "20081001" +%s`
				if [ $tnow -gt $t1996 ] && [ $tnow -lt $t2004 ]; then
					# 96 version
					echo "${xsz} to 96xsz..."
					cp ${xsz} ../96xsz/${xsz}.jpg
				fi

				if [ $tnow -lt $t2008 ] && [ $tnow -gt $t2004 ]; then
					# 2014 version
					echo "${xsz} to 04xsz..."
					cp ${xsz} ../04xsz/${xsz}.jpg
				fi
					
				#{ set +x; } 2>/dev/null
			fi
	  	done 
		cd ..
	fi
done


