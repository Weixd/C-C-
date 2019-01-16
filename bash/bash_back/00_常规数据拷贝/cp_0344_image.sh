# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# author:   xeast
# date:     20181031
# function: 拷贝有问题照片的原始文件
# # # # # # ## # # # # # ## #  ## # # ## # ## # # ## # # # ## # # # # ##  ### # # ## # ## # # ## # ## #  ## # #   ## # # ##

#!/bin/bash


while read line
do
	cp ${line} /media/public/973e2912-c898-4b6d-bc52-dad9f73e61fc/public/xeast/data_source/precheck/问题汇总/0344_error

done < list.txt

