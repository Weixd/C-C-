#!/bin/bash

date1='2018-12-03'
date2='2018-12-04'
for cate in '0111' '0112' '0113' '0157' '0158' '0201' '0202' '0203' '0204' '0205' '0206' '0207' '0208' '0209' '0210' '0297' '0298' '0299' '0321' '0352' '0322' '0348' '0351' '0344' '0323'	
do

mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT reason,count(reason)  FROM car_schema.check_infos where category='$cate' and result in('1','5') and created_at>'$date1' and created_at<'$date2' group by reason" >> data1.csv;

echo 'first stype finished......'

mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT category,count(category)  FROM car_schema.check_infos where category='$cate'  and result in('1','5') and created_at>'$date1' and created_at<'$date2' group by category" >> data1.csv;

echo 'second stype finished......'

mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT CONCAT( ROUND(T1.pass/T2.allpass*100,2) ) from (SELECT count(*) AS pass FROM car_schema.check_infos where category='$cate' and result ='1' and created_at>'$date1' and created_at<'$date2') AS T1, (SELECT count(*) AS allpass FROM car_schema.check_infos where category='$cate' and result in('1','5') and created_at>'$date1' and created_at<'$date2') AS T2 " >> data1.csv;

echo 'third stype finished......'

done

mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT count(*)  FROM car_schema.check_infos where result ='1' and created_at>'$date1' and created_at<'$date2'" >> data1.csv;

echo '1st stype finished......'

mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT count(*)  FROM car_schema.check_infos where result in('1','5') and created_at>'$date1' and created_at<'$date2'" >> data1.csv;

echo '2nd stype finished......'

mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT CONCAT( ROUND(T1.pass/T2.allpass*100,2) ) from (SELECT count(*) AS pass FROM car_schema.check_infos where result ='1' and created_at>'$date1' and created_at<'$date2')  AS T1,(SELECT count(*) AS allpass FROM car_schema.check_infos where result in('1','5') and created_at>'$date1' and created_at<'$date2') AS T2" >> data1.csv;

echo '3rd stype finished......'

mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT count(*)  FROM car_schema.vehicle_checks where is_pass = '1' and created_at>'$date1' and created_at<'$date2'" >> data1.csv;

echo '4th stype finished......'


mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT count(*)  FROM car_schema.vehicle_checks where is_pass in ('1','0') and created_at>'$date1' and created_at<'$date2'" >> data1.csv;

echo '5th stype finished......'

mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT CONCAT( ROUND(T1.pass/T2.allpass*100,2) ) from (SELECT count(*) AS pass FROM car_schema.vehicle_checks where is_pass = '1' and created_at>'$date1' and created_at<'$date2') AS T1, (SELECT count(*) AS allpass FROM car_schema.vehicle_checks where is_pass in ('1','0') and created_at>'$date1' and created_at<'$date2') AS T2 " >> data1.csv;

echo '6th stype finished......'

mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT prog_version,alg_version FROM car_schema.software_version order by id desc limit 1" >> data1.csv;
