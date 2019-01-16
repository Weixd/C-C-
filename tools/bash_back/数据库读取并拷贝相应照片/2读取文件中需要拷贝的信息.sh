#!/bin/bash

count=1
for line in `cat ~/0158_k31.txt`
do
    result=""
    if [ "$count" -eq "1" ]
    then #跳过第一行非数据
        echo $count
        let count++
        continue
    fi

    cp /home/public/251/01.chejianxianchang/11.南昌车管所/zip/samples/pic0158/0158_$line*   ~/0158
    let count++
    echo $count
done

count=1
for line in `cat ~/0158_k32.txt`
do
    result=""
    if [ "$count" -eq "1" ]
    then #跳过第一行非数据
        echo $count
        let count++
        continue
    fi

    cp /home/public/251/01.chejianxianchang/11.南昌车管所/zip/samples/pic0158/0158_$line* ~/0158
    let count++
    echo $count
done

count=1
for line in `cat ~/0158_k33.txt`
do
    result=""
    if [ "$count" -eq "1" ]
    then #跳过第一行非数据
        echo $count
        let count++
        continue
    fi

    cp /home/public/251/01.chejianxianchang/11.南昌车管所/zip/samples/pic0158/0158_$line* ~/0158
    let count++
    echo $count
done

count=1
for line in `cat ~/0158_k34.txt`
do
    result=""
    if [ "$count" -eq "1" ]
    then #跳过第一行非数据
        echo $count
        let count++
        continue
    fi

    cp /home/public/251/01.chejianxianchang/11.南昌车管所/zip/samples/pic0158/0158_$line* ~/0158
    let count++
    echo $count
done

