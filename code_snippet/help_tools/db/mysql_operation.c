//实现查询功能  
#include "mysql.h"  
#include <stdio.h>  
#include <stdlib.h>  
#include <string.h>  
  
#define _HOST_ "127.0.0.1"  //主机  
#define _USER_ "root"    //数据库用户，不是操作用户  
#define _PASSWD_ "123"   //数据库root用户的密码  
#define _DB_NAME_ "scott" //数据库名称  
  
  
int main()  
{  
    //1. 初始化  
    MYSQL * mysql = mysql_init(NULL);  
    if(mysql == NULL){  
        printf("mysql init err\n");  
       exit(1);   
    }  
    // 设置字符编码
    if (mysql_options(mysql, MYSQL_SET_CHARSET_NAME, "utf8") != 0)
    {
        printf("mysql_options(MYSQL_SET_CHARSET_NAME) failed! \n");
        exit(1);
    }
    //2. 连接  
    mysql = mysql_real_connect(mysql,_HOST_,_USER_,_PASSWD_,_DB_NAME_,0, NULL,0);  
    if(mysql == NULL){  
        printf("connect to mysql err\n");  
        exit(1);  
    }  
    printf("welcome to mysql \n");  
    //使用mysql_query执行查询，但是并没有得到结果集  
    char rSql[512]="select * from emp";  
    if(mysql_query(mysql,rSql) ){  
        printf(" query err:%s\n",rSql);  
        exit(1);  
    }  
    //需要调用mysql_store_result()获取结果集  
    MYSQL_RES *result = mysql_store_result(mysql);  
    unsigned int num_fields;  
    int i;  
    num_fields = mysql_num_fields(result);//取列数  
  
    //打印表头  
    MYSQL_FIELD *fields;  
    fields = mysql_fetch_fields(result);  
    for(i = 0; i < num_fields; i++)  
    {  
       printf("%s\t", fields[i].name);  
    }  
    printf("\n-----------------------------------------------------------------------\n");//华丽的分割线  
    //打印结果集  
    if(result != NULL){  
        //有结果及，需要处理  
        MYSQL_ROW row;  
        //fetch_row 获取每一行，打印  
        while((row = mysql_fetch_row(result)) ){  
            //得到一行  
              
            for(i = 0 ; i < num_fields ; i ++){  
                printf("%s\t",row[i]);  
            }  
            printf("\n");//每行处理加一个换行  
        }  
        //释放  
        mysql_free_result(result);//释放结果集  
    }  
      
    //3. 断开  
    mysql_close(mysql);  
    return 0;
}
