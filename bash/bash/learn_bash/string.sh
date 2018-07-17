#!/bin/bash

echo "子串截取操作 路径分割"
var1="etc/httpd/conf/httpd.conf"
echo $var1
echo "dirname"
dirname $var1
echo "basename"
basename $var1

echo '${var1/old/new}替换第一次出现的位置'
echo ${var1/\//##}
echo '${var1//old/new}全局替换'
echo ${var1//\//##}

echo '${var1:起始位置:长度}'
var1="hello world"
echo ${var1:3:5}

echo "获取随机字符串"
echo `head -1 /dev/urandom | md5sum | cut -b 1-8`
