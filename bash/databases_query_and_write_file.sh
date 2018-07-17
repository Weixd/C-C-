# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# author:   xeast
# date:     20180716
# function: get vehicel check mysql database type 0204 image pass and not pass.
# # # # # # ## # # # # # ## #  ## # # ## # ## # # ## # # # ## # # # # ##  ### # # ## # ## # # ## # ## #  ## # #   ## # # ##

#!/bin/bash
rm ~/pass.txt
rm ~/not_pass.txt

HOSTNAME="localhost"
PORT="3306"
USERNAME="root"
PASSWORD="passworld"
DBNAME="dbname"
TABLENAME="tablename"

# 0204 pass iamge
select_sql="SELECT name FROM TABLENAME where created_at > '2018-07-12 00:00:00' and name like '0204'"
mysql -h${HOSTNAME}  -P${PORT}  -u${USERNAME} -p${PASSWORD} ${DBNAME} -e "${select_sql}" > ~/pass.txt;

# 0204 not pass
select_sql="SELECT name FROM car_TABLENAME where created_at > '2018-07-12 00:00:00' and name not like '1'"
mysql -h${HOSTNAME}  -P${PORT}  -u${USERNAME} -p${PASSWORD} ${DBNAME} -e "${select_sql}" > ~/not_pass.txt;
