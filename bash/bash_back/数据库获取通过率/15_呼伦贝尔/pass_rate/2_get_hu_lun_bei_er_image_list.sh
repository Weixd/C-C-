#!/bin/bash


mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT name FROM car_schema.check_infos where category like '0201' and reason = '行驶证-照片:[车架号不正确]' and vehicle_check_id in (SELECT id FROM car_schema.vehicle_checks) " >> hu_lun_bei_er_0201_image_list.txt


mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT name FROM car_schema.check_infos where category like '0202' and reason = '牌证申请表-照片:[车牌号不正确]' and vehicle_check_id in (SELECT id FROM car_schema.vehicle_checks) " >> hu_lun_bei_er_0202_image_list.txt


mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT name FROM car_schema.check_infos where category like '0203' and reason = '交强险-照片:[车架号不正确]' and vehicle_check_id in (SELECT id FROM car_schema.vehicle_checks) " >> hu_lun_bei_er_0203_image_list.txt


mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT name FROM car_schema.check_infos where category like '0204' and reason = '检验报告-照片:[车架号不正确]' and vehicle_check_id in (SELECT id FROM car_schema.vehicle_checks) " >> hu_lun_bei_er_0204_image_list.txt


mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT name FROM car_schema.check_infos where category like '0205' and reason = '机动车查验记录表-照片:[车牌号不正确][外观检验员未签字]' and vehicle_check_id in (SELECT id FROM car_schema.vehicle_checks) " >> hu_lun_bei_er_0205_image_list.txt


mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT name FROM car_schema.check_infos where category like '0206' and reason = '行驶证反面-照片:[没有车辆]' and vehicle_check_id in (SELECT id FROM car_schema.vehicle_checks) " >> hu_lun_bei_er_0206_image_list.txt


mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT name FROM car_schema.check_infos where category like '0209' and reason = '尾气检测报告-照片:[车架号不正确]' and vehicle_check_id in (SELECT id FROM car_schema.vehicle_checks) " >> hu_lun_bei_er_0209_image_list.txt
