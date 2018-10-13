// 该命令可以获取当前目录下所有文件的md5值
find ./ -type f -exec md5sum {} \; | sork -k 2 > ~/MD5.txt
