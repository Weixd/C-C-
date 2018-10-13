#!/bin/bash

echo "emdata#2018" | sudo -S unzip /home/public/CJ/Chejianyilaibao.zip
echo "emdata#2018" | sudo -S chmod -R 777 /home/public/CJ/Chejianyilaibao

echo "emdata#2018" | sudo -S dpkg -i /home/public/CJ/Chejianyilaibao/mysql-common_5.7.20-0ubuntu0.16.04.1_all.deb
echo "emdata#2018" | sudo -S debconf-set-selections <<< 'mysql-server-5.7.20 mysql-server/root_password password em-data-9527'
echo "emdata#2018" | sudo -S debconf-set-selections <<< 'mysql-server-5.7.20 mysql-server/root_password_again password em-data-9527'
echo "emdata#2018" | sudo -S dpkg -i /home/public/CJ/Chejianyilaibao/*.deb

echo "emdata#2018" | sudo -S mkdir /opt/vehicle
echo "emdata#2018" | sudo -S mkdir /opt/vehicle/database
echo "emdata#2018" | sudo -S mkdir /opt/vehicle/vehicle_photo
echo "emdata#2018" | sudo -S mkdir /opt/vehicle/demo_photo
echo "emdata#2018" | sudo -S mkdir /opt/vehicle/vehicle_video
echo "emdata#2018" | sudo -S mkdir /opt/vehicle/program

echo "emdata#2018" | sudo -S chmod 777 /opt/vehicle/vehicle_photo
echo "emdata#2018" | sudo -S chmod 777 /opt/vehicle/demo_photo
echo "emdata#2018" | sudo -S chmod 777 /opt/vehicle/vehicle_video

echo "emdata#2018" | sudo -S service mysql stop
echo "emdata#2018" | sudo -S cp -a /var/lib/mysql /opt/vehicle/database/
echo "emdata#2018" | sudo -S sed -i 's|\/var\/lib\/mysql|\/opt\/vehicle\/database\/mysql|g' /etc/mysql/mysql.conf.d/mysqld.cnf
echo "emdata#2018" | sudo -S sed -i '$a character-set-server=utf8' /etc/mysql/mysql.conf.d/mysqld.cnf
echo "emdata#2018" | sudo -S sed -i 's|\/var\/lib\/mysql\/|\/opt\/vehicle\/database\/mysql\/|g' /etc/apparmor.d/usr.sbin.mysqld
echo "emdata#2018" | sudo -S sed -i 's|\/var\/lib\/mysql\/\*|\/opt\/vehicle\/database\/mysql\/\*|g' /etc/apparmor.d/usr.sbin.mysqld
echo "emdata#2018" | sudo -S service apparmor restart
echo "emdata#2018" | sudo -S service mysql start

echo "emdata#2018" | sudo -S mv /home/public/CJ/CheJian_boot  /opt/vehicle/program

echo "emdata#2018" | sudo -S mv /home/public/CJ/CheJian.conf /etc/ld.so.conf.d
echo "emdata#2018" | sudo -S ldconfig


exit
