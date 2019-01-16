#!/bin/bash

date1='2018-01-01'
date2='2018-09-27'



for cate in '0202' '0290' '0322' '0348' '0344' '0323'
do

    for rea in '牌证申请表-照片:[车牌号不正确]' '尾气检测报告-照片:[没有签名]' '一轴制动工位-照片:[车牌号不正确]' '二轴制动工位-照片:[车轮位置不对]' '底盘动态检验开始-照片:[车牌号不正确]' '底盘检验-照片:[车牌号不正确]'
    do

	mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT name FROM car_schema.check_infos where category in ('$cate') and result in('5') and reason in ('$rea') and id in (SELECT id FROM car_schema.vehicle_checks where jyjgbh=6300000065) " >> qing_hai_6300000065_error_image_list.txt;

    done
done
