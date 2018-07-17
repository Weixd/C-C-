#!/bin/bash

echo "root123" | sudo -S touch /opt/file.txt
echo "root123" | sudo -S rm /opt/file.txt

# &> 不区分正常信息错误信息重覆盖重定向 &>> 追加重定向
# 2> 错误信息覆盖重定向,2是stderr. 2>> 追加重定向
echo "root123" | sudo -S find /etc -name "*.conf" -type f | wc -l &> ~/result.txt
ps -aux | grep httpd &>> ~/result.txt
touch /opt/test.txt 2> ~/error.txt

# 逻辑与 && 
# 逻辑或 ||
# 顺序执行 :
mkdir ~/newdir 2>> ~/error.txt && echo "succeed" # mkdir succeed will echo succeed
mkdir ~/newdir 2>> ~/error.txt || echo "failed" # mkdir succeed, no message else mkdir failed will echo failed.
cd ../
ls -l ./
cd -

rm ~/error.txt
rm ~/result.txt
rmdir newdir

name="weixiaodong" # 双引号 允许引用 转义
var="i am ${name}"
echo ${var}

var='i am ${name}' # 单引号 禁止引用 转义
echo ${var}

comd=`uname -a`	   # 反撇号或者 $() 以命令输出进行替换
echo ${comd}

echo "当前执行脚本程序名称: $0"
echo "执行时一共输入 $# 个位置参数"
echo "其中第一个参数是:$1"
echo "其中第一个参数是:$2"
echo "所有的参数如下: $*"

