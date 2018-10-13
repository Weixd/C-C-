#### mysql

```
today(2018-07-06) on my coding way, while I'm use mysql API, when i get MySQL handle and called mysql_real_query() function, in the first, it will be right, but behind the first it will be wrong.like this:
	mysql_init(&mysql);
	mysql_real_connect();
	for () {
		mysql_real_query();
	}
it will be OK the first,but behind the first will be wrong all the time.

solve the question:
	add the called API for get the result can solved.
	MySQL_RES* result = mysql_store_result(&mysql);
```
