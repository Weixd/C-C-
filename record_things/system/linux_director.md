#### linux director mean

```
// core version 2.2.1 stable, core version 4.13.0 unstable

arch // 每一个目录代表一种支持的体系 i386 表示inter cpu 及与之兼容体系的子目录，一般pc机基于此目录

include // 核心编译需要的大部分头文件，与平台无关的头文件在include/linux目录下,与inter cpu相关的头文件在inclulde/asm-i386子目录下，include/scsi目录则是有关scsi设备的头文件目录.

init //这个目录包含核心的初始化，包含两个文件，main.c和version.c，这是研究核心如何工作的一个好起点

Mm //该目录包含所有独立于cpu体系结构的内存管理代码

Kernel // 主要的核心代码，此目录下的文件实现了大多数linux系统的内核函数，其中最重要的文件当属sched.c；同样，和体系结构相关的代码在arch/*/kernel中；

Drivers // 放置系统所有的设备驱动程序;每种驱动程序又各占用一个子目录：如，/block　下为块设备驱动程序，比如ide（ide.c）。如果你希望查看所有可能包含文件系统的设备是如何初始化的，你可以看drivers/block/genhd.c中的device_setup()。它不仅初始化硬盘，也初始化网络，因为安装nfs文件系统的时候需要网络
	其他:如,Lib放置核心的库代码;　Net,核心与网络相关的代码;　Ipc,这个目录包含核心的进程间通讯的代码;Fs,所有的文件系统代码和各种类型的文件操作代码，它的每一个子目录支持一个文件系统，例如fat和ext2;

Scripts // 此目录包含用于配置核心的脚本文件等。一般，在每个目录下，都有一个　.depend　文件和一个　Makefile　文件，这两个文件都是编译时使用的辅助文件，仔细阅读这两个文件对弄清各个文件这间的联系和依托关系很有帮助；而且，在有的目录下还有Readme　文件，它是对该目录下的文件的一些说明，同样有利于我们对内核源码的理解；
```
