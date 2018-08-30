#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <getopt.h>

int
main(int argc, char **argv)
{
   int opt;
   int digit_optind = 0;
   int option_index = 0;
   char *optstring = "i:b:c:d";// -i 参数
   // required_argument 必须加参数
   // no_argument 没有参数
   // optional_argument 参数可选
   static struct option long_options[] = {
       {"ip", required_argument, NULL, 'i'},// --ip 参数
       {"noarg",  no_argument,       NULL, 'n'},
       {"optarg", optional_argument, NULL, 'o'},
       {0, 0, 0, 0}
   };
 
   while ( (opt = getopt_long(argc, argv, optstring, long_options, &option_index)) != -1)
   {
        printf("opt = %c\n", opt);
        printf("optarg = %s\n", optarg);
        printf("optind = %d\n", optind);
        printf("argv[optind - 1] = %s\n",  argv[optind - 1]);
        printf("option_index = %d\n", option_index);
   }
 
   return 0;
}

/*
cashey@ubuntu:~/Desktop/getopt$ ./test_getopt_long -a 100 --reqarg 100 --nonarg
opt = a
optarg = 100
optind = 3
argv[optind - 1] = 100
option_index = 0
opt = r
optarg = 100
optind = 5
argv[optind - 1] = 100
option_index = 0
./test_getopt_long: unrecognized option '--nonarg'
opt = ?
optarg = (null)
optind = 6
argv[optind - 1] = --nonarg
option_index = 0

int getopt(int argc, char * const argv[], const char *optstring);

int getopt_long(int argc, char * const argv[], const char *optstring,
                const struct option *longopts, int *longindex);
在这里，longopts指向的是一个由option结构体组成的数组，那个数组的每个元素，指明了一个“长参数”（即形如--name的参数）名称和性质：

           struct option {
               const char *name;
               int         has_arg;
               int        *flag;
               int         val;
           };

       name  是参数的名称

       has_arg 指明是否带参数值，其数值可选：
              no_argument (即 0) 表明这个长参数不带参数（即不带数值，如：--name）
              required_argument (即 1) 表明这个长参数必须带参数（即必须带数值，如：--name Bob）
            optional_argument（即2）表明这个长参数后面带的参数是可选的，（即--name和--name Bob均可）

       flag   当这个指针为空的时候，函数直接将val的数值从getopt_long的返回值返回出去，当它非空时，val的值会被赋到flag指向的整型数中，而函数返回值为0

       val    用于指定函数找到该选项时的返回值，或者当flag非空时指定flag指向的数据的值。

另一个参数longindex，如果longindex非空，它指向的变量将记录当前找到参数符合longopts里的第几个元素的描述，即是longopts的下标值
当所给的参数存在问题时，opt（即函数返回值是'?'），如：
cashey@ubuntu:~/Desktop/getopt$ ./test_getopt_long -a
./test_getopt_long: option requires an argument -- 'a'
opt = ?
optarg = (null)
optind = 2
argv[optind - 1] = -a
option_index = 0
cashey@ubuntu:~/Desktop/getopt$ ./test_getopt_long --reqarg
./test_getopt_long: option '--reqarg' requires an argument
opt = ?
optarg = (null)
optind = 2
argv[optind - 1] = --reqarg

最后说说getopt_long_only函数，它与getopt_long函数使用相同的参数表，在功能上基本一致，只是getopt_long只将--name当作长参数，但getopt_long_only会将--name和-name两种选项都当作长参数来匹配。在getopt_long在遇到-name时，会拆解成-n -a -m -e到optstring中进行匹配，而getopt_long_only只在-name不能在longopts中匹配时才将其拆解成-n -a -m -e这样的参数到optstring中进行匹配。
*/
