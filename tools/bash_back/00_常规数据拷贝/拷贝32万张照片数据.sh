#!/bin/bash
#320000数据复制

count=0
for file in `ls ~/source_image`
do
    echo $file
    cp ~/source_image/$file ~/image/
    let count++
    echo $count
    if [ $count == 32000 ]
    then
        break
    fi
done
