#!/bin/bash 

old="3.115.1"
new="3.116.1"

for ipp in '215' '216' '217'
do

	ssh public@192.168.1.$ipp 'cp -R /opt/vehicle/program/Release_'${old}'/ /opt/vehicle/program/Release_'${new}
	ssh public@192.168.1.$ipp 'ln -nsf /opt/vehicle/program/Release_'${new}' /opt/vehicle/program/chejian'
	scp CheJian public@192.168.1.$ipp:/opt/vehicle/program/Release_${new}/bin/
	scp lib* public@192.168.1.$ipp:/opt/vehicle/program/Release_${new}/lib/

	ssh 192.168.1.$ipp
	echo "emdata#2018" | sudo -S ldconfig
	exit
done

ssh public@192.168.21.220 'cp -R /opt/vehicle/program/Release_'${old}'/ /opt/vehicle/program/Release_'${new}
ssh public@192.168.21.220 'ln -nsf /opt/vehicle/program/Release_'${new}' /opt/vehicle/program/chejian'
scp CheJian public@192.168.21.220:/opt/vehicle/program/Release_${new}/bin/
scp lib* public@192.168.21.220:/opt/vehicle/program/Release_${new}/lib/
ssh 192.168.21.220
echo "emdata#2018" | sudo -S ldconfig
exit

ssh public@192.168.31.247 'cp -R /opt/vehicle/program/Release_'${old}'/ /opt/vehicle/program/Release_'${new}
ssh public@192.168.31.247 'ln -nsf /opt/vehicle/program/Release_'${new}' /opt/vehicle/program/chejian'
scp CheJian public@192.168.31.247:/opt/vehicle/program/Release_${new}/bin/
scp lib* public@192.168.31.247:/opt/vehicle/program/Release_${new}/lib/
ssh 192.168.31.247
echo "emdata#2018" | sudo -S ldconfig
exit

ssh public@192.168.39.199 'cp -R /opt/vehicle/program/Release_'${old}'/ /opt/vehicle/program/Release_'${new}
ssh public@192.168.39.199 'ln -nsf /opt/vehicle/program/Release_'${new}' /opt/vehicle/program/chejian'
scp CheJian public@192.168.39.199:/opt/vehicle/program/Release_${new}/bin/
scp lib* public@192.168.39.199:/opt/vehicle/program/Release_${new}/lib/
ssh 192.168.39.199
echo "emdata#2018" | sudo -S ldconfig
exit

