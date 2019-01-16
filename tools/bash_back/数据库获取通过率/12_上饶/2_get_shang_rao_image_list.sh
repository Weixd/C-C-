#!/bin/bash


mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT name FROM car_schema.check_infos where category like '0157' and reason = '安全带-照片:[没有安全带]' and vehicle_check_id in (SELECT id FROM car_schema.vehicle_checks where device_id=0) " >> shang_rao_0157_image_list.txt


mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT name FROM car_schema.check_infos where category like '0203' and reason = '交强险-照片:[车牌号不正确]' and vehicle_check_id in (SELECT id FROM car_schema.vehicle_checks where device_id=0) " >> shang_rao_0203_image_list.txt


mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT name FROM car_schema.check_infos where category like '0204' and reason = '检验报告-照片:[车牌号不正确][车架号不正确]' and vehicle_check_id in (SELECT id FROM car_schema.vehicle_checks where device_id=0) " >> shang_rao_0204_image_list.txt


mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT name FROM car_schema.check_infos where category like '0209' and reason = '尾气检测报告-照片:[检查结论不通过]' and vehicle_check_id in (SELECT id FROM car_schema.vehicle_checks where device_id=0) " >> shang_rao_0209_image_list.txt


mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT name FROM car_schema.check_infos where category like '0348' and reason = '二轴制动工位-照片:[车轮位置不对]' and vehicle_check_id in (SELECT id FROM car_schema.vehicle_checks where device_id=0) " >> shang_rao_0348_image_list.txt


mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT name FROM car_schema.check_infos where category like '0344' and reason = '底盘动态检验开始-照片:车未移动
' and vehicle_check_id in (SELECT id FROM car_schema.vehicle_checks where device_id=0) " >> shang_rao_0344_image_list.txt


mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT name FROM car_schema.check_infos where category like '0351' and reason = '底盘检验-照片:[底盘不在工位][车牌号不正确]' and vehicle_check_id in (SELECT id FROM car_schema.vehicle_checks where device_id=0) " >> shang_rao_0351_image_list.txt

