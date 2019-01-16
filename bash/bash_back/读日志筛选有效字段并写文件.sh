#!/bin/bash
#读取日志文件并筛选时间信息并重定向到新文件
# needs input 1> log path 

model_name="./result/huochexiang_model.txt"
total_name="./result/huochexiang_total.txt"

`rm $model_name $total_name`

while read line
do
    # set function start
    if [[ $line == *huochexiang*start* ]]
    then
#	`echo $line >> $model_name`
#	`echo $line >> $total_name`
	start_flg=true
    fi
    
    if [[ $start_flg == true ]]
    then
	# get model time
	if [[ $line == *model*time* ]]
	then # analysis model time
            for word in $line
            do  
                if [[ $word == *.* ]]
                then        # get float number
                    temp_value=${word%%s*}     # delete 's'
                    `echo $temp_value >> $model_name`
                fi  
            done
        fi
	# get total time
	if [[ $line == *total*time* ]]
	then # analysis total time
            for word in $line
            do  
                if [[ $word == *.* ]]
                then        # get float number
                    temp_value=${word%%s*}     # delete 's'
                    `echo $temp_value >> $total_name`
                fi  
            done
        fi 
    fi

    # set function end
    if [[ $line == *huochexiang*end* ]]
    then # analysis total time
#        `echo $line >> $model_name`
#        `echo $line >> $total_name`
        let count++
	echo $count
#        `echo ">> count: $count" >> $model_name`
#        `echo ">> count: $count" >> $total_name`
	start_flg=false
    fi  
done < $1 #$log_path
