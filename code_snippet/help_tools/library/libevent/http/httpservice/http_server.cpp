/* 1. 创建事件集合  // event_base是event的一个集合,event_base中存放你是监听是否就绪的event。一般情况下一个线程一个event_base，多个线程的情况下需要开多个event_base。event_base主要是用来管理和实现事件的监听循环。
 *      struct event_base *event_base_new(void);
 *   销毁方法：
 *      void event_base_free(struct event_base *base);
 *   重新初始化：
 *      int event_reinit(struct event_base *base);
 * 2. 查看IO模型
 *   当我们创建一个event_base的时候，libevent会自动为我们选择最快的IO多路复用模型，Linux下一般会用epoll模型。
 *   下面这个方法主要是用来获取IO模型的名称。
 *   const char *event_base_get_method(const struct event_base *base);
 * 3. 销毁event_base
 *   void event_base_free(struct event_base *base);
 * 4. 事件循环 event loop
 *   在内部不断的循环监听注册上来的事件
 *   int event_base_dispatch(struct event_base *base);
 *   返回值：0 表示成功退出  -1 表示存在错误信息。
 *
 *   int event_base_loop(struct event_base *base, int flags);
 *   flags:
 *      #define EVLOOP_ONCE             0x01       // 阻塞直到有一个活跃的event，然后执行完活跃事件的回调就退出。
 *      #define EVLOOP_NONBLOCK         0x02       // 不阻塞，检查哪个事件准备好，调用优先级最高的那一个，然后退出。
 *      #define EVLOOP_NO_EXIT_ON_EMPTY 0x04
 *      0: 如果参数填了0，则只有事件进来的时候才会调用一次事件的回调函数，比较常用
 *
 * 事件循环停止的情况：
 *  1. event_base中没有事件event
 *  2. 调用event_base_loopbreak()，那么事件循环将停止
 *  3. 调用event_base_loopexit()，那么事件循环将停止
 *  4. 程序错误，异常退出
 *
 *  两个退出的方法：这两个函数成功返回 0 失败返回 -1
 *   int event_base_loopexit(struct event_base *base,const struct timeval *tv);
 *      // 指定在 tv 时间后停止事件循环
 *      // 如果 tv == NULL 那么将无延时的停止事件循环,如果当前正在为多个活跃事件调用回调函数，那么不会立即退出，而是等到所有的活跃事件的回调函数都执行完成后才退出事件循环
 *   int event_base_loopbreak(struct event_base *base);
 *      // 立即停止事件循环（而不是无延时的停止),如果当前正在为多个活跃事件调用回调函数，那么当前正在调用的回调函数会被执行，然后马上退出事件循环，而并不处理其他的活跃事件了
 *
 * event 事件 // event_base是事件的集合，负责事件的循环，以及集合的销毁。而event就是event_base中的基本单元：事件。
 * 1. 创建一个事件event
 *  struct event *event_new(struct event_base *base,    // base：即event_base
 *                          evutil_socket_t fd,         // fd：文件描述符。fd文件描述符已准备好可写或者可读、fd马上就准备好可写和可读
 *                          short what,                 // what：event关心的各种条件. EV_TIMEOUT 超时，EV_READ 可读，EV_WRITE 可写，EV_SIGNAL 信号检测，EV_PERSIST 持久监听，EV_ET 边缘触发
 *                          event_callback_fn cb,       // cb：回调函数。
 *                          void *arg);                 // arg：用户自定义的数据，可以传递到回调函数中去。
 * 2. 释放event_free
 *  void event_free(struct event *event);
 *  删除事件，即将事件转换为非pending或者非activing状态
 *  int event_del(struct event *event);
 * 3. 注册event
 *  int event_add(struct event *ev,             // ev 为事件指针
 *                const struct timeval *tv);    // tv 为时间指针
 *  RETURN：0表示成功 -1 表示失败
 *   tv时间结构例子：
 *      struct timeval five_seconds = {5, 0};
 *      event_add(ev1, &five_seconds);
 *
 *  4.event_assign
 *    event_new每次都会在堆上分配内存。有些场景下并不是每次都需要在堆上分配内存的，这个时候我们就可以用到event_assign方法.
 *    已经初始化或者处于pending的event，首先需要调用event_del()后再调用 event_assign()。这个时候就可以重用这个event了。
 *    int event_assign(struct event *event, struct event_base *base,evutil_socket_t fd, short what,void (*callback)(evutil_socket_t, short, void *), void *arg);
 *      // 此函数用于初始化 event（包括可以初始化栈上和静态存储区中的 event）
 *      // event_assign() 和 event_new() 除了 event 参数之外，使用了一样的参数
 *      // event 参数用于指定一个未初始化的且需要初始化的 event
 *      // 函数成功返回 0 失败返回 -1
 *      // 类似上面的函数，此函数被信号 event 使用
 *      event_assign(event, base, signum, EV_SIGNAL|EV_PERSIST, callback, arg)
 *  5. 信号事件
 *   evsignal_new(base,     // base --- event_base
 *                signum,   // signum --- 信号，例如 SIGHUP
 *                cb,       // callback --- 信号出现时调用的回调函数
 *                arg)      // arg --- 用户自定义数据
 *   evsignal_add(ev,       // 将信号 event 注册到 event_base
 *                tv)       // struct timeval
 *   evsignal_del(ev)       // 清理信号 event
 *
 * 6. event细节
 *  1. 每一个事件event都需要通过event_new初始化生成。event_new生成的事件是在堆上分配的内存
 *  2. 当一个事件通过event_add被注册到event_base上的时候，这个事件处于pending（等待状态），当只有事件进来的时候，event才会被激活active状态，相关的回调函数就会被调用
 *  3. persistent 如果event_new中的what参数选择了EV_PERSIST，则是持久的类型。持久的类型调用完回调函数后，会继续转为pending状态，就会继续等待事件进来。大部分情况下会选择持久类型的事件
 *  4. 而非持久的类型的事件，调用完一次之后，就会变成初始化的状态。这个时候需要调用event_add 继续将事件注册到event_base上之后才能使用。
*/
#include <unistd.h>
#include <sys/stat.h>
#include <time.h>
#include "http_server.h"
#include <stdlib.h>
#include <event2/buffer.h>
#include <event2/keyvalq_struct.h>
#include <event2/http_struct.h>
#include <string.h>
#include <string>

void request_handler(struct evhttp_request *req, void *arg);
void method_handler_post(struct evhttp_request *req);
void analysis_client_post(struct evhttp_request *req);

HTTPServer::HTTPServer(unsigned int port)
{
    this->port = port;

    base = event_base_new(); // 1
    if (base == NULL) {
        fprintf(stderr, "event_base_new() failed! \n");
        return;
    }

    http = evhttp_new(base);
    if (evhttp_bind_socket(http, "0.0.0.0", port) != 0) {
        evhttp_free(http);
        event_base_free(base);
        fprintf(stderr, "evhttp_bind_socket() failed! \n");
        return;
    }

    /* 绑定事件处理函数 */
    evhttp_set_gencb(http, request_handler, this);
}

HTTPServer::~HTTPServer()
{
    if (http != NULL) {
        evhttp_free(http);
    }

    if (base != NULL) {
        event_base_free(base);
    }
}

void HTTPServer::startListen()
{
    /* 启动事件循环 */
    printf("HTTP server listening(%s:%d)...... \n", "0.0.0.0", port);
    event_base_dispatch(base);
}

/* make evhttp_cmd_type in libevent convert to http standard request */
std::string convert_httpmethod(evhttp_cmd_type cmd_type)
{
    std::string method;

    switch (cmd_type)
    {
        case EVHTTP_REQ_GET:     method = "GET"; break;
        case EVHTTP_REQ_POST:    method = "POST"; break;
        case EVHTTP_REQ_HEAD:    method = "HEAD"; break;
        case EVHTTP_REQ_PUT:     method = "PUT"; break;
        case EVHTTP_REQ_DELETE:  method = "DELETE"; break;
        case EVHTTP_REQ_OPTIONS: method = "OPTIONS"; break;
        case EVHTTP_REQ_TRACE:   method = "TRACE"; break;
        case EVHTTP_REQ_CONNECT: method = "CONNECT"; break;
        case EVHTTP_REQ_PATCH:   method = "PATCH"; break;
        default:                 method = "";
    }

    return method;
}

void request_handler(struct evhttp_request *req, void *arg)
{
    evhttp_cmd_type cmd_type = evhttp_request_get_command(req);
    const char *uri = evhttp_request_get_uri(req);

    printf("HTTP server received a request(Method:%s, URI:%s) \n", convert_httpmethod(cmd_type).c_str(), uri);

    /* 验证URI */
    if (strcmp("/test.asmx", uri) != 0)
    {
        printf("The URI(%s) is undefined! \n", uri);
        evhttp_send_error(req, HTTP_NOTFOUND, NULL);
        return;
    }

    if (cmd_type == EVHTTP_REQ_POST) {
        analysis_client_post(req);
    } else {
        printf("The Method(%s) is undefined! \n", convert_httpmethod(cmd_type).c_str());
        evhttp_send_error(req, HTTP_BADMETHOD, NULL);
    }
}

void get_current_date_time(std::string& current_date, std::string& current_time)
{
    std::string tmp;
    time_t timep;
    struct tm *pcurrent_time;
    time(&timep);
    pcurrent_time =localtime(&timep);

    int year  = pcurrent_time->tm_year+1900;
    int month = pcurrent_time->tm_mon+1;
    int day   = pcurrent_time->tm_mday;
    int hour  = pcurrent_time->tm_hour;
    int min   = pcurrent_time->tm_min;
    int sec   = pcurrent_time->tm_sec;

    tmp = std::to_string(year);
    current_date.append(tmp);
    current_date.append("-");
    tmp = std::to_string(month);
    current_date.append(tmp);
    current_date.append("-");
    tmp = std::to_string(day);
    current_date.append(tmp);
    current_date.append(" ");

    tmp = std::to_string(hour);
    current_time.append(tmp);
    current_time.append(":");
    tmp = std::to_string(min);
    current_time.append(tmp);
    current_time.append(":");
    tmp = std::to_string(sec);
    current_time.append(tmp);
}

// analysis client message
void analysis_client_post(struct evhttp_request *req)
{
    struct evkeyvalq *headers;
    struct evkeyval *header;

    printf(">>>>>>> headers: \n");
    headers = evhttp_request_get_input_headers(req);
    for (header = headers->tqh_first; header; header = header->next.tqe_next)
        printf("key[%s]: value[%s]\n", header->key, header->value);

    struct evbuffer *buf = evhttp_request_get_input_buffer(req);

    size_t len = evbuffer_get_length(buf);
    char *recv_data = (char *)malloc(len + 1);
    evbuffer_copyout(buf, recv_data, len);
    *(recv_data + len) = 0;

    std::string xmlData = std::string(recv_data);
    free(recv_data);
    fprintf(stdout, "%s\n", xmlData.c_str());
}
