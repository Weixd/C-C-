/*
1.创建epoll句柄
    int epfd = epoll_create(int size);  // size用来告诉内核这个监听的数目一共有多大。

2.将被监听的描述符添加到epoll句柄或从epool句柄中删除或者对监听事件进行修改, 该函数用于控制某个epoll文件描述符上的事件，可以注册事件，修改事件，删除事件。
    函数声明：int epoll_ctl(int epfd,                 // epfd：由 epoll_create 生成的epoll专用的文件描述符；

                          int op,                   // op：要进行的操作.
                                                    // EPOLL_CTL_ADD    注册新的fd到epfd中
                                                    // EPOLL_CTL_MOD    修改已经注册的fd的监听事件
                                                    // EPOLL_CTL_DEL    从epfd中删除一个fd

                          int fd,                   // fd：需要监听的fd
                          struct epoll_event *event)// event：告诉内核需要监听什么事件,指向epoll_event的指针；
    如果调用成功返回0,不成功返回-1

    struct epoll_event {
        __uint32_t events; // EPOLLIN：  触发该事件，表示对应的文件描述符上有可读数据。(包括对端SOCKET正常关闭)；
                           // EPOLLOUT： 触发该事件，表示对应的文件描述符上可以写数据；
                           // EPOLLPRI：        表示对应的文件描述符有紧急的数据可读（这里应该表示有带外数据到来）；
                           // EPOLLERR：        表示对应的文件描述符发生错误；
                           // EPOLLHUP：        表示对应的文件描述符被挂断；
                           // EPOLLET：         将EPOLL设为边缘触发(Edge Triggered)模式，这是相对于水平触发(Level Triggered)来说的。
                           // EPOLLONESHOT：    只监听一次事件，当监听完这次事件之后，如果还需要继续监听这个socket的话，需要再次把这个socket加入到EPOLL队列里。
        epoll_data_t data; // User data variable
    };

    typedef union epoll_data {
        void *ptr;
        int fd;
        __uint32_t u32;
        __uint64_t u64;
    } epoll_data_t;

3.等待事件触发，当超过timeout还没有事件触发时，就超时。
    函数声明:int epoll_wait(int epfd,struct epoll_event * events,int maxevents,int timeout) //     该函数用于轮询I/O事件的发生；
    参数：
        epfd:由epoll_create 生成的epoll专用的文件描述符；
        events:用来从内核得到事件的集合,回传代处理事件的数组；
        maxevents:每次能处理的事件数；
        timeout:等待I/O事件发生的超时值；-1相当于阻塞，0相当于非阻塞。一般用-1即可
        返回发生事件数,返回需要处理的事件数目，如返回0表示已超时。
    epoll_wait运行的原理是
        等侍注册在epfd上的socket fd的事件的发生，如果发生则将发生的sokct fd和事件类型放入到events数组中,并且将注册在epfd上的socket fd的事件类型给清空.
        如果下一个循环你还要关注这个socket fd的话，则需要用epoll_ctl(epfd,EPOLL_CTL_MOD,listenfd,&ev)来重新设置socket fd的事件类型。这时不用EPOLL_CTL_ADD,因为socket fd并未清空，只是事件类型清空。这一步非常重要。
*/
#include <iostream>
#include <sys/socket.h>
#include <sys/epoll.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <errno.h>
#include <strings.h>

using namespace std;

#define MAXLINE 5
#define OPEN_MAX 100
#define LISTENQ 20
#define SERV_PORT 5000
#define INFTIM 1000

void setnonblocking(int sock)
{
    int opts;
    opts=fcntl(sock,F_GETFL);
    if(opts<0)
    {
        perror("fcntl(sock,GETFL)");
        exit(1);
    }
    opts = opts|O_NONBLOCK;
    if(fcntl(sock,F_SETFL,opts)<0)
    {
        perror("fcntl(sock,SETFL,opts)");
        exit(1);
    }
}

int main(int argc, char* argv[])
{
    int i, listenfd, connfd, sockfd, epfd, nfds, portnumber;
    ssize_t n;
    char line[MAXLINE];
    socklen_t clilen;

    if ( 2 == argc )
    {
        if( (portnumber = atoi(argv[1])) < 0 )
        {
            fprintf(stderr, "Usage:%s portnumber/a/n", argv[0]);
            return 1;
        }
    }
    else
    {
        fprintf(stderr, "Usage:%s portnumber/a/n", argv[0]);
        return 1;
    }

    //声明epoll_event结构体的变量,ev用于注册事件,数组用于回传要处理的事件
    struct epoll_event ev, events[20];

    //生成用于处理accept的epoll专用的文件描述符
    epfd = epoll_create(256);   // *********** 1 *************

    listenfd = socket(AF_INET, SOCK_STREAM, 0); // tcp socket
    //把socket设置为非阻塞方式
//    setnonblocking(listenfd);

    //设置与要处理的事件相关的文件描述符
    ev.data.fd = listenfd;

    //设置要处理的事件类型
    ev.events = EPOLLIN | EPOLLET;
    //ev.events=EPOLLIN;

    //注册epoll事件
    struct sockaddr_in clientaddr;
    struct sockaddr_in serveraddr;
    epoll_ctl(epfd, EPOLL_CTL_ADD, listenfd, &ev);    // *********** 2 *************

    bzero(&serveraddr, sizeof(serveraddr));
    serveraddr.sin_family = AF_INET;
    char *local_addr = (char *)"0.0.0.0";
    inet_aton(local_addr, &(serveraddr.sin_addr));
    serveraddr.sin_port = htons(portnumber);
    bind(listenfd, (sockaddr *)&serveraddr, sizeof(serveraddr));
    listen(listenfd, LISTENQ);
    printf("server ip:[%s] port:[%d] waiting...\n", local_addr, portnumber);

    for ( ; ; )
    {
        //等待epoll事件的发生
        nfds = epoll_wait(epfd, events, 20, 500);    // *********** 3 *************

        //处理所发生的所有事件
        for(i=0; i<nfds; ++i)
        {
            if(events[i].data.fd == listenfd) // 如果新监测到一个socket用户连接到了server绑定的socket端口，建立新的连接。
            {
                cout << "new socket." << endl;
                connfd = accept(listenfd, (sockaddr *)&clientaddr, &clilen);
                if(connfd < 0){
                    perror("connfd < 0");
                    exit(1);
                }
//                setnonblocking(connfd);

                char *str = inet_ntoa(clientaddr.sin_addr);
                cout << "accapt a connection from " << str << endl;

                ev.data.fd = connfd; // 设置用于读操作的文件描述符

                ev.events=EPOLLIN | EPOLLET; // 设置用于注册的读操作事件

                epoll_ctl(epfd, EPOLL_CTL_ADD, connfd, &ev); // 注册ev
            }
            else if(events[i].events & EPOLLIN)//如果是已经连接的用户，并且收到数据，那么进行读入。
            {
                cout << "EPOLLIN" << endl;
                if ( (sockfd = events[i].data.fd) < 0)
                    continue;

                do{
                    if ( (n = read(sockfd, line, MAXLINE)) < 0)
                    {
                        if (errno == ECONNRESET)
                        {
                            close(sockfd);
                            events[i].data.fd = -1;
                        }
                        else
                            std::cout<<"readline error"<<std::endl;
                    }
                    else if (n == 0)
                    {
                        close(sockfd);
                        events[i].data.fd = -1;
                    }
                    line[n] = '\0';
                    cout << "read :" << line << endl;
                }while(MAXLINE == n);

                ev.data.fd = sockfd;    // 设置用于写操作的文件描述符

                ev.events = EPOLLOUT | EPOLLET;     // 设置用于注测的写操作事件

                //epoll_ctl(epfd,EPOLL_CTL_MOD,sockfd,&ev);     // 修改sockfd上要处理的事件为EPOLLOUT
            }
            else if(events[i].events & EPOLLOUT) // 如果有数据发送
            {
                sockfd = events[i].data.fd;
                write(sockfd, line, n);

                ev.data.fd = sockfd;  // 设置用于读操作的文件描述符

                ev.events = EPOLLIN | EPOLLET; // 设置用于注测的读操作事件

                epoll_ctl(epfd, EPOLL_CTL_MOD, sockfd, &ev); // 修改sockfd上要处理的事件为EPOLIN
            }
        }
    }
    return 0;
}
