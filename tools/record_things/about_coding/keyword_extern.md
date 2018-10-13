#### keyword extern
---

* extern修饰变量和函数
```
在C语言中，修饰符extern用在变量或者函数的声明前，用来说明“此变量/函数是在别处定义的，要在此处引用”。extern声明不是定义，即不分配存储空间。
在一个文件中定义了变量和函数， 在其他文件中要使用它们， 可以有两种方式：
    1.使用头文件，然后声明它们，然后其他文件去包含头文件
    2.在其他文件中直接extern
```

* extern"C"作用
```
比如说你用C 开发了一个DLL 库，为了能够让C ++语言也能够调用你的DLL 输出(Export) 的函数，你需要用extern "C" 来强制编译器不要修改你的函数名。

1. 现在要写一个c语言的模块，供以后使用（以后的项目可能是c的也可能是c++的），源文件事先编译好，编译成.so或.o都无所谓。头文件中声明函数时要用条件编译包含起来，如下：
#ifdef __cpluscplus    
extern "C" {
#endif
    
//some code
    
#ifdef __cplusplus    
}
#endif 
也就是把所有函数声明放在some code的位置。

2. 如果这个模块已经存在了，可能是公司里的前辈写的，反正就是已经存在了，模块的.h文件中没有extern "C"关键字，这个模块又不希望被改动的情况下，可以这样，在你的c++文件中，包含该模块的头文件时加上extern "C", 如下：
extern "C" {
#include "test_extern_c.h"    
}

3.上面例子中，如果仅仅使用模块中的1个函数，而不需要include整个模块时，可以不include头文件，而单独声明该函数，像这样: 
extern "C" {
int ThisIsTest(int, int);
}
第3点要注意:当单独声明函数时候， 就不能要头文件，或者在头文件中不能写extern intThisIsTest(int a, int b);否则会有error C2732: 链接规范与“ThisIsTest”的早期规范冲突，这个错误，
然后就可一使用模块中的这个ThisIsTest函数了。
还有就是要注意在*.c文件中不能写成extern"C"intThisIsTest(int x,int y);在C语言的头文件中，对其外部函数只能指定为extern类型，C语言中不支持extern "C"声明，在.c文件中包含了extern "C"时会出现编译语法错误。
```
