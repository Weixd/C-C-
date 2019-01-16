# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# author:   xeast
# date:     20180716
# function: 获取车捡MySQL数据库0204照片类型通过和不通过结果，并写入文件.
# # # # # # ## # # # # # ## #  ## # # ## # ## # # ## # # # ## # # # # ##  ### # # ## # ## # # ## # ## #  ## # #   ## # # ##

#!/bin/bash
rm ~/0204_pass.txt
rm ~/0204_not_pass.txt

HOSTNAME="localhost"
PORT="3306"
USERNAME="root"
PASSWORD="em-data-9527"
DBNAME="car_schema"
TABLENAME="check_infos"

# 0204 pass iamge
select_sql="SELECT name FROM car_schema.check_infos where created_at > '2018-07-12 00:00:00' and category like '0204' and reason like '通过'"
mysql -h${HOSTNAME}  -P${PORT}  -u${USERNAME} -p${PASSWORD} ${DBNAME} -e "${select_sql}" > ~/0204_pass.txt;

# 0204 not pass
select_sql="SELECT name FROM car_schema.check_infos where created_at > '2018-07-12 00:00:00' and category like '0204' and reason not like '车辆类型不在软件处理范围内' and reason not like '使用性质不在软件处理范围' and reason not like '检验类别不在软件处理范围内' and result not like '1' and result like '4'"
mysql -h${HOSTNAME}  -P${PORT}  -u${USERNAME} -p${PASSWORD} ${DBNAME} -e "${select_sql}" > ~/0204_not_pass.txt;
