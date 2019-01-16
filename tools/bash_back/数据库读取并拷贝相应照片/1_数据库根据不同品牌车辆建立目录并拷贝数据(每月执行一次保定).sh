#!/bin/bash


HOSTNAME="localhost"
PORT="3306"
USERNAME="root"
PASSWORD="em-data-9527"
DBNAME="car_schema"
TABLENAME="check_infos"

#获取数据库不同的车辆类型
select_sql="SELECT zzcmc,clpp,clxh FROM car_schema.vehicle_checks group by zzcmc,clpp,clxh"
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
select_sql="SELECT vehicle_check_id,name FROM car_schema.check_infos where category like \"0113\""
mysql -h${HOSTNAME}  -P${PORT}  -u${USERNAME} -p${PASSWORD} ${DBNAME} -e "${select_sql}" > ./id_path.txt;
#获取不同id对应的图片信息
imagenum=0
while read line
do
	echo LINE:$line
	id=`echo ${line} | awk '{split($0,a," ");print a[1]}'`
	path=`echo ${line} | awk '{split($0,a," ");print a[2]}'`
	if [ ${id} = "vehicle_check_id" ];then
		continue
	fi

	#获取该id对应的制造厂名称，车辆品牌，车辆型号
	select_sql="SELECT zzcmc,clpp,clxh FROM car_schema.vehicle_checks where id like ${id}"
	mysql -h${HOSTNAME}  -P${PORT}  -u${USERNAME} -p${PASSWORD} ${DBNAME} -e "${select_sql}" > ./temp.txt;
	#准备拷贝
	while read line_
	do
		zzcmc=`echo ${line_} | awk '{split($0,a," ");print a[1]}'`
		clpp=`echo ${line_} | awk '{split($0,a," ");print a[2]}'`
		clxh=`echo ${line_} | awk '{split($0,a," ");print a[3]}'`
		if [ ${zzcmc} = "zzcmc" ];then
			continue
		fi

		cp_dest_dir=${zzcmc};cp_dest_dir+="/";cp_dest_dir+=${clpp};cp_dest_dir+="/";cp_dest_dir+=${clxh}
		echo DEST_DIR:${cp_dest_dir}

		cp ${path}	${cp_dest_dir}
	done < ./temp.txt

	let imagenum+=1
done < ./id_path.txt
echo IMAGE_NUM:${imagenum}
