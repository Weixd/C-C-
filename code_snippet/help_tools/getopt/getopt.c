#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
 
int main(int argc, char *argv[])
{
    int opt;
    char *optstring = "a:b:c:d";//代表 -a 必须加参数 -b 必须加参数 -c 必须加参数 -d 必须加参数
 
    while ((opt = getopt(argc, argv, optstring)) != -1)
    {
        printf("opt = %c\n", opt);
        printf("optarg = %s\n", optarg);
        printf("optind = %d\n", optind);
        printf("argv[optind-1] = %s\n\n",  argv[optind-1]);
    }
 
    return 0;
}

/* 
cashey@ubuntu:~/Desktop/getopt$ ./test_getopt -a 100 -b 200 -c admin -d
opt = a
optarg = 100
optind = 3
argv[optind - 1] = 100
 
opt = b
optarg = 200
optind = 5
argv[optind - 1] = 200
 
opt = c
optarg = admin
optind = 7
argv[optind - 1] = admin
 
opt = d
optarg = (null)
optind = 8
argv[optind - 1] = -d
*/
