#### keyword explicit
---

> explicit关键字只能用于修饰只有一个参数的类构造函数, 它的作用是表明该构造函数是显示的, 而非隐式的, 跟它相对应的另一个关键字是implicit, 意思是隐藏的,类构造函数默认情况下即声明为implicit(隐式).
> 注意：当类的声明和定义分别在两个文件中时，explicit只能写在在声明中，不能写在定义中。

```
class Test1  
{  
public :  
    Test1(int num):n(num){}  
private:  
    int n;  
};

class Test2  
{  
public :  
    explicit Test2(int num):n(num){}  
private:  
    int n;  
};

int main()  
{  
    Test1 t1 = 12; // 12赋值给t1时，会隐式调用Test1的构造，实际赋值给t1的是一个用数字12生成的对象
    Test2 t2(13);  // 这个没啥说的，正常调用
    Test2 t3 = 14; // 错误，因为Test2的构造函数不允许隐式转换(14赋值给t3会隐式调用Test2的构造函数)
          
    return 0;  
}


```
