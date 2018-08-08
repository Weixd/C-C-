#!/bin/bash

ftpip="116.236.215.22"
ftpuser="ftper"
ftppasswd="3Ay@u7G$"
dateStr=`date +"%Y-%m-%d"`

su - public -c "tar cvf /opt/vehicle/UploadTemp/""$dateStr"".tar -C /opt/vehicle/vehicle_photo/ ""$dateStr""/"
ftp -n<<!
open $ftpip
user $ftpuser $ftppasswd
binary
cd suzhou
put /opt/vehicle/UploadTemp/"$dateStr".tar "$dateStr"_214.tar
close
bye
!
rm -f /opt/vehicle/UploadTemp/"$dateStr".tar

ips=("215" "216" "217")
for iip in ${ips[@]};do
su - public -c "mkdir /opt/vehicle/UploadTemp/192.168.1.""$iip""/"
su - public -c "scp -r public@192.168.1.""$iip"":/opt/vehicle/vehicle_photo/""$dateStr"" /opt/vehicle/UploadTemp/192.168.1.""$iip""/"
su - public -c "tar cvf /opt/vehicle/UploadTemp/""$dateStr"".tar -C /opt/vehicle/UploadTemp/192.168.1.""$iip""/ ""$dateStr""/"
ftp -n<<!
open $ftpip
user $ftpuser $ftppasswd
binary
cd suzhou
put /opt/vehicle/UploadTemp/"$dateStr".tar "$dateStr"_"$iip".tar
close
bye
!
rm -f /opt/vehicle/UploadTemp/"$dateStr".tar
rm -fr /opt/vehicle/UploadTemp/192.168.1."$iip"/*
done

ips=("218")
for iip in ${ips[@]};do
su - public -c "mkdir /opt/vehicle/UploadTemp/192.168.1.""$iip""/"
su - public -c "scp -r publicer@192.168.1.""$iip"":/opt/vehicle/vehicle_photo/""$dateStr"" /opt/vehicle/UploadTemp/192.168.1.""$iip""/"
su - public -c "tar cvf /opt/vehicle/UploadTemp/""$dateStr"".tar -C /opt/vehicle/UploadTemp/192.168.1.""$iip""/ ""$dateStr""/"
ftp -n<<!
open $ftpip
user $ftpuser $ftppasswd
binary
cd suzhou
put /opt/vehicle/UploadTemp/"$dateStr".tar "$dateStr"_"$iip".tar
close
bye
!
rm -f /opt/vehicle/UploadTemp/"$dateStr".tar
rm -fr /opt/vehicle/UploadTemp/192.168.1."$iip"/*
done

