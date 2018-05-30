#### linux 中libevent常用API

```
* 创建事件集
	struct event_base* event_base_new()

* 创建事件
	struct event event_new( struct event_base,  // 事件所在事件集
							evutil_socket_t,	// socket的描述符
							short,				// 事件类型 EV_READ等待读事件发生, EV_WRITE写事件发生, 或者它俩组合.
												// EV_SIGNAL等待事件的号码, 都不包含就是超时事件或者手动激活事件.
						 	event_callback_fn, 	// 事件发生调用的回调函数
							void*)				// 回调函数的参数值

* 添加事件和删除时间
	int event_add(  struct event* ev, 			// 需要添加的事件
					const struct timeval* timeout) // 事件的最大等待值, NULL表示永远等待

	int event_del( struct event*) // 要删除的事件

* 分配监听事件
	int event_base_dispatch(struct event_base*) // 需要监视的事件集

* I/O buffer事件
	struct bufferevent* bufferevent_socket_new( struct event_base* base, // 需要添加到的事件集
												evutil_socket_t fd,		 // 相关的文件描述符
												int options)			 // 0或者相应的BEV_OPT_* 可选标志

	int bufferevent_enable( struct bufferevent* bev, // 需要启用的bufferevent
							short event) 			 // any combination of EV| READ | EV_WRITE

	int bufferevent_disable(struct bufferevent* bev, short event) // 参数同上

	size_t bufferevent_read(struct bufferevent bev, // 读取的buffer_event事件
							void data, 				// 存储数据的指针
							size_t size)			// 数据buffer的大小
													// 返回值: 读取数据的字节数
	
	int bufferevent_write(	struct bufferevent bev, // 读取的buffer_event事件
							const void data,		// 存储数据的指针
							size_t size)			// 要写入数据的大小,字节数
