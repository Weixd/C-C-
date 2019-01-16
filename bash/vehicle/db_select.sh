#!/bin/bash
#数据库查找照片类型

select reason,count(reason) from check_infos where created_at > '2018-09-15' and category = '0201' group by reason
