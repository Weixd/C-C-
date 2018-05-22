#include <stdio.h>
#include "md5.hpp"

int main()
{
    std::string hashdata("woshi");
    std::string dest = xeast::md5_hash_string(hashdata);
    printf("md5 hash dest [%x] \n", dest.c_str());

    return 0;
}
