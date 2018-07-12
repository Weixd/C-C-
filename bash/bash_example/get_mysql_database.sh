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

DBNAME="test_db"
TABLENAME="test_table"

ARRAY=(\"test1\" \"test2\" \"test3\" \"test4\" \"test5\" \"test6\" \"test7\" \"test8\" \"test9\")

for var in  ${ARRAY[*]}
do
    echo ${var} >> ~/result.csv 
    select_sql="select * from ${ARRAY} where sqls like ${var}"
    mysql -h${HOSTNAME}  -P${PORT}  -u${USERNAME} -p${PASSWORD} ${DBNAME} -e "${select_sql}" >> ~/result.csv
done
