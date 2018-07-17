#!/bin/bash

echo "password" | sudo -S unzip /home/public/CJ/Chejianyilaibao.zip
echo "password" | sudo -S chmod -R 777 /home/public/CJ/Chejianyilaibao

echo "password" | sudo -S dpkg -i /home/public/CJ/Chejianyilaibao/mysql-common_5.7.20-0ubuntu0.16.04.1_all.deb
echo "password" | sudo -S debconf-set-selections <<< 'mysql-server-5.7.20 mysql-server/root_password password em-data-9527'
echo "password" | sudo -S debconf-set-selections <<< 'mysql-server-5.7.20 mysql-server/root_password_again password em-data-9527'
echo "password" | sudo -S dpkg -i /home/public/CJ/Chejianyilaibao/*.deb

echo "password" | sudo -S mkdir /opt/vehicle
echo "password" | sudo -S mkdir /opt/vehicle/database
echo "password" | sudo -S mkdir /opt/vehicle/vehicle_photo
echo "password" | sudo -S mkdir /opt/vehicle/demo_photo
echo "password" | sudo -S mkdir /opt/vehicle/vehicle_video
echo "password" | sudo -S mkdir /opt/vehicle/program

echo "password" | sudo -S chmod 777 /opt/vehicle/vehicle_photo
echo "password" | sudo -S chmod 777 /opt/vehicle/demo_photo
echo "password" | sudo -S chmod 777 /opt/vehicle/vehicle_video

echo "password" | sudo -S service mysql stop
echo "password" | sudo -S cp -a /var/lib/mysql /opt/vehicle/database/
echo "password" | sudo -S sed -i 's|\/var\/lib\/mysql|\/opt\/vehicle\/database\/mysql|g' /etc/mysql/mysql.conf.d/mysqld.cnf
echo "password" | sudo -S sed -i '$a character-set-server=utf8' /etc/mysql/mysql.conf.d/mysqld.cnf
echo "password" | sudo -S sed -i 's|\/var\/lib\/mysql\/|\/opt\/vehicle\/database\/mysql\/|g' /etc/apparmor.d/usr.sbin.mysqld
echo "password" | sudo -S sed -i 's|\/var\/lib\/mysql\/\*|\/opt\/vehicle\/database\/mysql\/\*|g' /etc/apparmor.d/usr.sbin.mysqld
echo "password" | sudo -S service apparmor restart
echo "password" | sudo -S service mysql start

echo "password" | sudo -S mv /home/public/CJ/CheJian_boot  /opt/vehicle/program

echo "password" | sudo -S mv /home/public/CJ/CheJian.conf /etc/ld.so.conf.d
echo "password" | sudo -S ldconfig


exit
