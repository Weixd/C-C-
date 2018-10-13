#!/bin/bash

rm ~/0158_k31.txt
rm ~/0158_k32.txt
rm ~/0158_k33.txt
rm ~/0158_k34.txt

HOSTNAME="localhost"
PORT="3306"
USERNAME="root"
PASSWORD="em-data-9527"
DBNAME="car_schema"
TABLENAME="check_infos"

#数据库查找车辆是k31且照片类型为0158的小型车牌（双表查询）
select_sql="SELECT hphm FROM car_schema.vehicle_checks where cllx like 'k31' and id in (SELECT vehicle_check_id FROM car_schema.check_infos where category like '0158')"
mysql -h${HOSTNAME}  -P${PORT}  -u${USERNAME} -p${PASSWORD} ${DBNAME} -e "${select_sql}" > ~/0158_k31.txt;


#数据库查找车辆是k32且照片类型为0158的小型车牌（双表查询）
select_sql="SELECT hphm FROM car_schema.vehicle_checks where cllx like 'k32' and id in (SELECT vehicle_check_id FROM car_schema.check_infos where category like '0158')"
mysql -h${HOSTNAME}  -P${PORT}  -u${USERNAME} -p${PASSWORD} ${DBNAME} -e "${select_sql}" > ~/0158_k32.txt;

#数据库查找车辆是k33且照片类型为0158的小型车牌（双表查询）
select_sql="SELECT hphm FROM car_schema.vehicle_checks where cllx like 'k33' and id in (SELECT vehicle_check_id FROM car_schema.check_infos where category like '0158')"
mysql -h${HOSTNAME}  -P${PORT}  -u${USERNAME} -p${PASSWORD} ${DBNAME} -e "${select_sql}" > ~/0158_k33.txt;

#数据库查找车辆是k34且照片类型为0158的小型车牌（双表查询）
select_sql="SELECT hphm FROM car_schema.vehicle_checks where cllx like 'k34' and id in (SELECT vehicle_check_id FROM car_schema.check_infos where category like '0158')"
mysql -h${HOSTNAME}  -P${PORT}  -u${USERNAME} -p${PASSWORD} ${DBNAME} -e "${select_sql}" > ~/0158_k34.txt;
