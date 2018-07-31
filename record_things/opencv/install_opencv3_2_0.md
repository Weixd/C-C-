#### ubuntu 16.04 安装opencv3.2.0

```
1、从库中安装是最简单的方式，直接运行下面命令(未测试)：
   sudo apt-get install libopencv-dev python-opencv
   如果安装出错，那么可以更新一下源，或是换一个源。

2、自己手动编译安装(未测试)
   首先安装OpenCV的依赖文件，在终端运行下面命令：
    sudo apt-get install build-essential
    sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
    sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev

3、下载最新的OpenCV源码包(安装成功)
   官网下载：http://opencv.org/opencv-3-2.html
   这里安装的是最新的版本：opencv-3.2.0.tar.gz

4、解压安装
   tar -xzvf opencv-3.2.0.tar.gz
   cd opencv-3.2.0/
   cmake .
   make 
   sudo make install


测试是否安装成功:
	运行命令：pkg-config --cflags --libs opencv 出现下面信息：

	[python] view plain copy
    	xeast@vmware:~/OpenCV$ pkg-config --cflags --libs opencv
    	-I/usr/local/include/opencv -I/usr/local/include -L/usr/local/lib -lopencv_shape -lopencv_stitching -lopencv_objdetect -lopencv_superres -lopencv_videostab -lopencv_calib3d -lopencv_features2d -lopencv_highgui -lopencv_videoio -lopencv_imgcodecs -lopencv_video -lopencv_photo -lopencv_ml -lopencv_imgproc -lopencv_flann -lopencv_core  
    	xeast@vmware:~/test/OpenCV$   
```

#### 运行一个最简的程序：

```
showimage.cpp

    #include <cv.h>  
    #include <highgui.h>  
    #include <opencv2/core/core.hpp>  
    #include <opencv2/highgui/highgui.hpp>  
      
    int main( int argc, char** argv )  
    {  
        cv::Mat image;
        image = cv::imread( argv[1], 1 );  
      
        if( argc != 2 || !cv::image.data )  
        {  
            printf( "No image data \n" );  
            return -1;  
        }  
      
        namedWindow( "Display Image", CV_WINDOW_AUTOSIZE );  
        cv::imshow( "Display Image", image );  
        waitKey(0);  
      
        return 0;  
    }  

g++编译方式
1、执行命令：
    g++ showimage.cpp -o test `pkg-config --cflags --libs opencv`
运行程序 ：./test   test.jpg
如果OpenCV安装成功，可以显示出图片：

如果出现./test: error while loading shared libraries: libopencv_highgui.so.3.2: cannot open shared object file: No such file or directory 错误，说明动态库没有找到。
	1、用vim打开/etc/ld.so.conf，注意要用sudo打开获得权限，不然无法修改，如：sudo vim /etc/ld.so.conf，在文件最后中加上一行 /usr/local/lib
	2、运行：
    	sudo ldconfig
