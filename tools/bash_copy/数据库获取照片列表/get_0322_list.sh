# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# author:   xeast
# date:     20181031
# function: 获取有问题照片的数据库路径
# # # # # # ## # # # # # ## #  ## # # ## # ## # # ## # # # ## # # # # ##  ### # # ## # ## # # ## # ## #  ## # #   ## # # ##

#!/bin/bash


HOSTNAME="localhost"
PORT="3306"
USERNAME="root"
PASSWORD="em-data-9527"

DBNAME="vehicle_precheck"
TABLENAME="vehicle_photo"

    select_sql="SELECT path from vehicle_precheck.vehicle_photo where result=0 and detail like '一轴制动工位照片:[车轮位置不对]' and record_time > '2018-10-15 00:00:00'"
    mysql -h${HOSTNAME} -P${PORT} -u${USERNAME} -p${PASSWORD} ${DBNAME} -e "${select_sql}" >> ./list.txt
