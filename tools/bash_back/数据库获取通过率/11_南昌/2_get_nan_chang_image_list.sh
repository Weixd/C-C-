#!/bin/bash


mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT name FROM car_schema.check_infos where category like '0112' and reason = '右后方-照片:[车牌号不正确]' and vehicle_check_id in (SELECT id FROM car_schema.vehicle_checks) " >> nan_chang_0112_image_list.txt


mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT name FROM car_schema.check_infos where category like '0201' and reason = '行驶证-照片:[行驶证编号（条形码）不正确]' and vehicle_check_id in (SELECT id FROM car_schema.vehicle_checks) " >> nan_chang_0201_image_list.txt


mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT name FROM car_schema.check_infos where category like '0203' and reason = '交强险-照片:[检验日期不在保险有效期内]' and vehicle_check_id in (SELECT id FROM car_schema.vehicle_checks) " >> nan_chang_0203_image_list.txt


mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT name FROM car_schema.check_infos where category like '0321' and reason = '左灯光工位-照片:[车牌号不正确]' and vehicle_check_id in (SELECT id FROM car_schema.vehicle_checks) " >> nan_chang_0321_image_list.txt


mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT name FROM car_schema.check_infos where category like '0322' and reason = '一轴制动工位-照片:[车轮位置不对]' and vehicle_check_id in (SELECT id FROM car_schema.vehicle_checks) " >> nan_chang_0322_image_list.txt


mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT name FROM car_schema.check_infos where category like '0351' and reason = '驻车制动工位-照片:[车牌号不正确]' and vehicle_check_id in (SELECT id FROM car_schema.vehicle_checks) " >> nan_chang_0351_image_list.txt

