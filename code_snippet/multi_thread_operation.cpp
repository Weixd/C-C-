// 多线程创建
#include <stdio.h>
#include <stdlib.h>
// pthread
#include <pthread.h>

void *thread0(void*);
void *thread1(void*);
void *thread2(void*);
void *thread3(void*);


int main(int argc, char *argv[])
{
	// thread pointer
	void*(*funcpointerarray[4])(void *);
    funcpointerarray[0] = thread0;
    funcpointerarray[1] = thread1;
    funcpointerarray[2] = thread2;
    funcpointerarray[3] = thread3;
    pthread_t pthread_id[4];


	// create multi thread to do something
	for (int i = 0; i < 4; i++) {
		int ret = pthread_create(&pthread_id[i], NULL, funcpointerarray[i], NULL);
		if (0 != ret) {
            printf("pthread_create error.../n");
		    exit(EXIT_FAILURE);
		}
	}

	return 0;	
}



void *thread0(void*)
{
}
void *thread1(void*)
{
}
void *thread2(void*)
{
}
void *thread3(void*)
{
}


// 互斥锁
// add mutex
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;


// lock
if(pthread_mutex_lock(&mutex) != 0) {
    perror("pthread_mutex_lock");
    exit(EXIT_FAILURE);
}

// atom operation
do something;

// unlock
if(pthread_mutex_unlock(&mutex) != 0) {
    perror("pthread_mutex_unlock");
    exit(EXIT_FAILURE);
}

