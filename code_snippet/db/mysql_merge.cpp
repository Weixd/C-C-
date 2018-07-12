#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "mysql/mysql.h"

#define _HOST_ "127.0.0.1"  //主机
#define _USER_ "root"    //数据库用户，不是操作用户
#define _PASSWD_ "em-data-9527"   //数据库root用户的密码
#define _DB_NAME_ "scott" //数据库名称

int mysql_connect(MYSQL *);
int mysql_search(MYSQL *, MYSQL_RES *, MYSQL_FIELD *, char*);

int main()
{
    MYSQL *mysql = NULL;
    int ret = 0;
    if ((ret = mysql_connect(mysql)) != 0) {
        switch (ret) {
        case 1:
            printf("mysql init error\n");
            break;
        case 2:
            printf("mysql char set error\n");
            break;
        case 3:
            printf("connect to mysql error\n");
            break;
        default:
            break;
        }
        exit(ret);
    }
    printf("welcome to mysql \n");

    char sql_query[512]="select * from car_schema.check_infos";
    MYSQL_RES *result;
    MYSQL_FIELD *fields;
    if((ret = mysql_search(mysql, result, fields, sql_query)) != 0) {
        switch (ret) {
        case 1:
            printf("query error:[%s]\n", sql_query);
            break;
        default:
            break;
        }
        exit(ret);
    }

    //3. 断开
    mysql_close(mysql);
    return 0;
}

int mysql_connect(MYSQL *mysql)
{
    //1. 初始化
    mysql = mysql_init(NULL);
    if(mysql == NULL)
        return 1;

    //2. 设置字符编码
    if (mysql_options(mysql, MYSQL_SET_CHARSET_NAME, "utf8") != 0)
        return 2;

    //3. 连接
    mysql = mysql_real_connect(mysql, _HOST_, _USER_, _PASSWD_, _DB_NAME_, 0, NULL, 0);
    if(mysql == NULL)
        return 3;

    return 0;
}

int mysql_search(MYSQL *mysql, MYSQL_RES *result, MYSQL_FIELD *fields, char* sql_query)
{
    //使用mysql_query执行查询，但是并没有得到结果集
    if(0 != mysql_query(mysql, sql_query))
        return 1;

    //需要调用mysql_store_result()获取结果集
    result = mysql_store_result(mysql);
    unsigned int num_fields;
    int i;
    num_fields = mysql_num_fields(result);//取列数

    //打印表头
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
}
