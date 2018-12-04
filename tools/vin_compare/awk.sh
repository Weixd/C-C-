#!/bin/bash

#awk 格式
# awk 'BEGIN{ print "start"} pattern{ commands } END{ print "end"} file'
# pattern命令默认执行{print}

echo -e "A line 1\nA line 2" | awk 'BEGIN{print "start"} {print} END{print "end"}'

# split分割字符串（默认空格分割）
awk 'BEGIN{ "date" | getline out; split(out, arry);  print arry[1]}'

# split用","分割字符串
awk 'BEGIN{str="it,is,a,test,string"; lens=split(str, tA, ","); print length(tA), lens}'
