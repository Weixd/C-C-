#!/bin/bash


HOSTNAME="localhost"
PORT="3306"
USERNAME="root"
PASSWORD="em-data-9527"
DBNAME="car_schema"
TABLENAME="check_infos"

#获取数据库不同的车辆类型
select_sql="SELECT zzcmc,clpp,clxh FROM car_schema.vehicle_checks WHERE created_at > '2019-01-01' GROUP BY zzcmc,clpp,clxh"
mysql -h${HOSTNAME}  -P${PORT}  -u${USERNAME} -p${PASSWORD} ${DBNAME} -e "${select_sql}" > ./file.txt;
#创建不同车辆类型的目录
dirnum=0
while read line
do
	echo LINE:$line
	zzcmc=`echo ${line} | awk '{split($0,a," ");print a[1]}'`
	clpp=`echo ${line} | awk '{split($0,a," ");print a[2]}'`
	clxh=`echo ${line} | awk '{split($0,a," ");print a[3]}'`
	if [ ${zzcmc} = "zzcmc" ];then
		continue
	fi

	dir=${zzcmc};dir+="/";dir+=${clpp};dir+="/";dir+=${clxh}
	echo ${dir}

	mkdir -p ${dir}

	let dirnum+=1
done < ./file.txt
echo DIR_NUM:${dirnum}

#获取id和path
select_sql="SELECT vehicle_check_id,name FROM car_schema.check_infos WHERE created_at > '2019-01-01' AND category like \"0113\""
mysql -h${HOSTNAME}  -P${PORT}  -u${USERNAME} -p${PASSWORD} ${DBNAME} -e "${select_sql}" > ./id_path.txt;
#获取不同id对应的图片信息
imagenum=0
while read line
do
	echo ID_PATH_LINE:$line
	id=`echo ${line} | awk '{split($0,a," ");print a[1]}'`
	path=`echo ${line} | awk '{split($0,a," ");print a[2]}'`
	if [ ${id} = "vehicle_check_id" ];then
		continue
	fi

	#获取该id对应的制造厂名称，车辆品牌，车辆型号
	select_sql="SELECT zzcmc,clpp,clxh,device_id FROM car_schema.vehicle_checks WHERE created_at > '2019-01-01' AND id like ${id}"
	mysql -h${HOSTNAME}  -P${PORT}  -u${USERNAME} -p${PASSWORD} ${DBNAME} -e "${select_sql}" > ./temp.txt;
	#准备拷贝
	while read line_
	do
		echo TEMP_LINE:${line_}
		zzcmc=`echo ${line_} | awk '{split($0,a," ");print a[1]}'`
		clpp=`echo ${line_} | awk '{split($0,a," ");print a[2]}'`
		clxh=`echo ${line_} | awk '{split($0,a," ");print a[3]}'`
		did=`echo ${line_} | awk '{split($0,a," ");print a[4]}'`
		if [ ${zzcmc} = "zzcmc" ];then
			continue
		fi

		echo DEVICE_ID:${did}
		cp_dest_dir=${zzcmc};cp_dest_dir+="/";cp_dest_dir+=${clpp};cp_dest_dir+="/";cp_dest_dir+=${clxh}
		echo DEST_DIR:${cp_dest_dir}

		if [ ${did} = 142 ];then
			cp ${path}	${cp_dest_dir}
			echo finish,142
		elif [ ${did} = 2 ];then
			scp 'public@192.168.8.144:'${path}	${cp_dest_dir}
			echo finish,144
		elif [ ${did} = 3 ];then
			scp 'public@192.168.8.145:'${path}	${cp_dest_dir}
			echo finish,145
		elif [ ${did} = 4 ];then
			scp 'public@192.168.8.146:'${path}	${cp_dest_dir}
			echo finish,146
		elif [ ${did} = 5 ];then
			scp 'public@192.168.8.147:'${path}	${cp_dest_dir}
			echo finish,147
		elif [ ${did} = 6 ];then
			scp 'public@192.168.8.148:'${path}	${cp_dest_dir}
			echo finish,148
		elif [ ${did} = 7 ];then
			scp 'public@192.168.8.149:'${path}	${cp_dest_dir}
			echo finish,149
		elif [ ${did} = 8 ];then
			scp 'public@192.168.8.150:'${path}	${cp_dest_dir}
			echo finish,150
		elif [ ${did} = 9 ];then
			scp 'public@192.168.8.151:'${path}	${cp_dest_dir}
			echo finish,151
		elif [ ${did} = 10 ];then
			scp 'public@192.168.8.152:'${path}	${cp_dest_dir}
			echo finish,152
		elif [ ${did} = 11 ];then
			scp 'public@192.168.8.153:'${path}	${cp_dest_dir}
			echo finish,153
		elif [ ${did} = 12 ];then
			scp 'public@192.168.8.154:'${path}	${cp_dest_dir}
			echo finish,154
		else
			scp 'public@192.168.8.143:'${path}	${cp_dest_dir}
			echo finish,143
		fi
	done < ./temp.txt

	let imagenum+=1
done < ./id_path.txt
echo IMAGE_NUM:${imagenum}
