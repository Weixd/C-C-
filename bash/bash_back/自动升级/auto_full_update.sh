#!/bin/bash 

ip="192.168.100"	#IP段
version_old="Release_3.109.0"  #升级前版本
version_new="Release_3.122.0" #升级后版本

for ipp in '90' '91' '92' '93' '95' '96' '97' #每台机器IP
do
	scp -r Release_3.122.0/ public@$ip.$ipp:/opt/vehicle/program/

	ssh public@$ip.$ipp 'cp /opt/vehicle/program/'${version_new}'/bin/*.xml /opt/vehicle/program/'${version_old}'/bin/'
	ssh public@$ip.$ipp 'cp /opt/vehicle/program/'${version_new}'/bin/*.lic /opt/vehicle/program/'${version_old}'/bin/'
	#ssh public@$ip.$ipp 'cp /opt/vehicle/program/'${version_new}'/model/*.txt /opt/vehicle/program/'${version_old}'/model/'
	ssh public@$ip.$ipp 'ln -nsf /opt/vehicle/program/'${version_old}'/ /opt/vehicle/program/chejian'

	ssh public@$ip.$ipp 'echo 'emdata#2018'|sudo -S ldconfig'
	ssh public@$ip.$ipp 'echo 'emdata#2018'|sudo -S /etc/init.d/chejian restart'

done