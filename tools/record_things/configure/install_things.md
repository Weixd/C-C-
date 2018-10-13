#### install and configure library
---

##### ubuntu install libevent

```
1. download the package about libevent
2. tar -xzvf libevent_name
3. cd libevent_name directory
4. ./configure
5. make
6. sudo make install
7. whereis libevent 	// can show the libevent's location
```

##### ubuntu install openssh

```
> 1. sudo apt-get install openssh-server
> 2. sudo service ssh start
> 3. ps -aux | grep ssh		// make sure the service of ssh is start?
```

##### ubuntu install google glog

```
1. git clone https://github.com/google/glog // 下载源码
2. sudo apt-get install autoconf automake libtool // 配置
3. cd glog && ./autogen.sh && ./configure && make -j 24 && sudo make install // 编译 安装
```
