#include <stdio.h>
#include <stdarg.h>
//打印n个整数

void print(int n,...)
{
	va_list ap;   //定义不定参数列表ap
	va_start(ap,n);  //得到第一个可变参数地址
	int i;
	for(i=0; i<n; i++)
		printf("%d ",va_arg(ap,int)); //每次取一个整型
}

void main()
{
	print(4,1,4,2,3); //打印1 4 2 3
}
