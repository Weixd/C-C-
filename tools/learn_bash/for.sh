#!/bin/bash

echo "for 变量名 in 取值列表"
echo "do"
echo "	命令序列"
echo "done"

for i in "1" "2" "3"
do
	echo $i
done

for word in `cat /etc/host.conf`
do
	echo $word
done
