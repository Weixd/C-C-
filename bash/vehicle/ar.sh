#!/bin/bash

# get local ip's last octet
IP=`ip route get 172.18.0.1 | awk '{print $NF; exit}'`
oct4=$(echo ${IP} | tr "." " " | awk '{ print $4 }')

dateStr=`date +"%Y-%m-%d"`
if [ -n "$1" ]; then
	dateStr="$1"
fi

for ff in `ls -d ${dateStr} | xargs -l basename`
do 
	if [ -d ${ff} ]; then 
		set -x;
		tar cf ${ff}_${oct4}.tar ./${ff};
		{ set +x; } 2>/dev/null
	fi
done

