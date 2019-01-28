#!/bin/bash
#功能：
#1.根据照片类型和检验机构编号输出统计结果为1和5的具体原因（reason）及数量
#2.输出结果为1和5的照片类型及数量
#3.输出所有照片类型结果为1、5的数量和通过率（1/1+5 *100%）
#4.输出整车结果为1、5的数量和通过率
#5.输出车检和算法版本号

#变量：
#date1:起始日期
#date2:终止日期 （可精确到时分秒 如'2018-12-12 17:21:00'）
#照片类型根据需要也可以增删

date1='2019-01-16'
date2='2019-02-18'

rm data1.csv
echo 'delete ok'
for cate in '0111' '0112' '0113' '0157' '0201' '0203' '0204' '0207' '0205' '0202' '0206' '0209' '0321' '0352' '0322' '0348' '0351' '0344' '0323'
do
	mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT reason,count(reason)  FROM car_schema.check_infos where category='$cate' and result in('1','5') and created_at>'$date1' and created_at<'$date2' and vehicle_check_id in(SELECT id FROM car_schema.vehicle_checks where jyjgbh='3200000073') group by reason" >> data1.csv;
	echo 'first stype finished......'

	mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT category,count(category) FROM car_schema.check_infos where category='$cate' and result in('1','5') and created_at>'$date1' and created_at<'$date2' and vehicle_check_id in(SELECT id FROM car_schema.vehicle_checks where jyjgbh='3200000073')  group by category" >> data1.csv;
	echo 'second stype finished......'

	mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT CONCAT( ROUND(T1.pass/T2.allpass*100,2) ) from (SELECT count(*) AS pass FROM car_schema.check_infos where category='$cate' and result ='1' and created_at>'$date1' and created_at<'$date2') AS T1, (SELECT count(*) AS allpass FROM car_schema.check_infos where category='$cate' and result in('1','5') and created_at>'$date1' and created_at<'$date2') AS T2 " >> data1.csv;
	echo 'third stype finished......'
done


