# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# author:   xeast
# date:     20180712
# function: get vehicel check mysql database which type image's passing rate
# # # # # # ## # # # # # ## #  ## # # ## # ## # # ## # # # ## # # # # ##  ### # # ## # ## # # ## # ## #  ## # #   ## # # ##

#!/bin/bash

`rm ~/result.csv`

HOSTNAME="localhost"
PORT="3306"
USERNAME="root"
PASSWORD="password"

DBNAME="dbname"
TABLENAME="tablename"

FIELDS=(\"0111\" \"0112\" \"0113\" \"0157\" \"0201\" \"0202\" \"0203\" \"0204\" \"0205\" \"0321\" \"0322\" \"0348\" \"0351\" \"0344\" \"0342\" \"0323\")

for var in  ${FILEDS[*]}
do
    echo ${var} >> ~/result.csv 
    select_sql="select show_view from ${TABLENAME} where filed like ${var} and created_at > \"2018-07-10 00:00:00\" group by reason"
    mysql -h${HOSTNAME}  -P${PORT}  -u${USERNAME} -p${PASSWORD} ${DBNAME} -e "${select_sql}" >> ~/result.csv
    echo "pass rate:" >> ~/result.csv
done
