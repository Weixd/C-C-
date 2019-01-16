#!/bin/bash


mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT name FROM car_schema.check_infos where category like '0203' and reason = '交强险-照片:[车牌号不正确][没有印章]' and vehicle_check_id in (SELECT id FROM car_schema.vehicle_checks) " >> shen_zhen_0203_image_list.txt


mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT name FROM car_schema.check_infos where category like '0322' and reason = '一轴制动工位-照片:[车轮位置不对]' and vehicle_check_id in (SELECT id FROM car_schema.vehicle_checks) " >> shen_zhen_0322_image_list.txt


mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT name FROM car_schema.check_infos where category like '0351' and reason = '驻车制动工位-照片:[车牌号不正确]' and vehicle_check_id in (SELECT id FROM car_schema.vehicle_checks) " >> shen_zhen_0351_image_list.txt


mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT name FROM car_schema.check_infos where category like '0344' and reason = '底盘动态检验结束-照片:车未移动' and vehicle_check_id in (SELECT id FROM car_schema.vehicle_checks) " >> shen_zhen_0344_image_list.txt


mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT name FROM car_schema.check_infos where category like '0323' and reason = '底盘检验-照片:[底盘不在工位][车牌号不正确]' and vehicle_check_id in (SELECT id FROM car_schema.vehicle_checks) " >> shen_zhen_0323_image_list.txt
