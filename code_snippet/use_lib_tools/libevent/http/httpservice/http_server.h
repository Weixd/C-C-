#ifndef _HTTP_SEREVER_
#define _HTTP_SEREVER_

#include <iostream>
#include <event2/event.h>
#include <event2/http.h>


class HTTPServer {
public:
    HTTPServer(unsigned int port);
    ~HTTPServer();
    void startListen();

private:
    unsigned int port = 0;
    event_base *base = NULL;
    evhttp *http = NULL;
};

#endif  //	_HTTP_SEREVER_

