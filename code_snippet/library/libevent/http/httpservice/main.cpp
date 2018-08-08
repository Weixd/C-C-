#include <stdio.h>
#include "http_server.h"

int main(int argc, char * argv[])
{
    int port = 10000;
    if(argc == 2)
    {
        port = atoi(argv[1]);
        if(port <= 0)
        {
            printf("wrong port and exit.\n");
            return 1;
        }
    }

    HTTPServer httpserver(port);
    httpserver.startListen();

    return 0;
}
