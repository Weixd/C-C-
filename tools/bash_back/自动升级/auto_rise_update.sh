#!/bin/bash 

ip="192.168.100"	#IP段
ver_b="Release_3.105.0"  #升级前版本
ver_a="Release_3.106.0" #升级后版本

for ipp in '114' #'92' '93' '94' '95' '96' '97' #每台机器IP
do

ssh public@$ip.$ipp 'mkdir /opt/vehicle/program/'${ver_a}'/'
ssh public@$ip.$ipp 'cp -r /opt/vehicle/program/'${ver_b}'/* /opt/vehicle/program/'${ver_a}'/'
ssh public@$ip.$ipp 'ln -nsf /opt/vehicle/program/'${ver_a}'/ /opt/vehicle/program/chejian'

scp check_item* CheJian public@$ip.$ipp:/opt/vehicle/program/${ver_a}/bin/
scp lib* public@$ip.$ipp:/opt/vehicle/program/${ver_a}/lib/
scp ss_* se_* le_* ls_* public@$ip.$ipp:/opt/vehicle/program/${ver_a}/model/encode/

ssh public@$ip.$ipp 'echo 'emdata#2018'|sudo -S ldconfig'
ssh public@$ip.$ipp 'echo 'emdata#2018'|sudo -S /etc/init.d/chejian restart'

done

