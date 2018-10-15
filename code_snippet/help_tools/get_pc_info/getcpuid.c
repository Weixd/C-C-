#ifndef STDIO_H
#define STDIO_H
#endif
#ifndef GETCPUID_C
#define GETCPUID_C
#endif

void get_cpu_id(char *id)
{
    unsigned   long   s1,s2,s3,s4;
    asm volatile
    ( "movl $0x01 , %%eax ; \n\t"
    "xorl %%edx , %%edx ;\n\t"
    "cpuid ;\n\t"
    "movl %%edx ,%0 ;\n\t"
    "movl %%eax ,%1 ; \n\t"
    :"=m"(s1),"=m"(s2)
    );

    asm volatile
    ("movl $0x03,%%eax ;\n\t"
    "xorl %%ecx,%%ecx ;\n\t"
    "xorl %%edx,%%edx ;\n\t"
    "cpuid ;\n\t"
    "movl %%edx,%0 ;\n\t"
    "movl %%ecx,%1 ;\n\t"
    :"=m"(s3),"=m"(s4)
    );

    sprintf(id, "%08X%08X%08X%08X", s1, s2, s3, s4);
    printf("cpu id: [%s] \n", id);
//    return id;
}
