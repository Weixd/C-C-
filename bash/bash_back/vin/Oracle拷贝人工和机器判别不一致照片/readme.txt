1. 首先确定下机器是否安装了 sqlplus，在终端执行命令 which sqlplus；
    1.1 如果没有安装，安装步骤如下：
        1.1.1 查看Oracle数据库版本（select * from v$version）
        1.1.2 去Oracle官网下载对应版本的 instantclient-basic和instantclient-sqlplus，一个（同版本的直接安装目录内两个 deb 文件）
        1.1.3 配置环境变量，打开 /etc/profile，在末尾添加如下：
             export ORACLE_HOME=/usr/lib/oracle/12.2/client64/
             export TNS_ADMIN=$ORACLE_HOME
             export PATH=$PATH:$ORACLE_HOME/bin
             export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ORACLE_HOME/lib
        1.1.4 保存之后，执行： source /etc/profile
        1.1.5 在终端执行 whereis oracle，显示oracle安装路径说明配置成功
