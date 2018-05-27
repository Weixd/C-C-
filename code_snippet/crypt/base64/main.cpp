#include <stdio.h>
#include <string.h>
#include "base64.hpp"

int main(int argc, char *argv[])
{
	if(argc < 2)
	{
		printf("please input data who will base64.\n");
		return -1;
	}

    std::string data;

    printf("source : %s \n", argv[1]);
    std::string endata = xeast::base64_encode(argv[1]);

    data = xeast::base64_decode(endata);
    printf("decode data: %s \n", data.c_str());

    return 0;
}
