#### linux start process

```
	* 所有的pc机都是通过执行ROM中的代码，加载启动盘0柱面0扇区中的代码来启动整个系统；
	* linux的0柱面0扇区中含有启动装载器LILO（定位内核并装载执行）；
	* 内核装载后，先进行设备初始化，然后加载登录磁盘中的根文件系统；
		// 如果内核找不到可装载的根文件系统，启动过程停止
		// 提示： VFS:Mounted root(ext2 filesystem) readonly.
	* 根文件系统加载完成后，执行init程序，init程序去执行/etc/inittab；
	* 最后启动getty，它负责console和ttys的通信，它在显示器打印login提示符并激活login程序；
```
