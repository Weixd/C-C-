#!/bin/bash

mkdir ~/image16000
mkdir ~/image16000/一致15380对

count=0
vin=""
for line in `ls ~/result机器识别结果/ori通过未篡改机器结果/一致`
do
    echo "通过且未篡改 96.13% 15380对"
    echo $count
    if [[ $line == *_1.jpg ]]
    then
        vin=`echo $line | cut -d '_' -f 1`
    else
        continue
    fi
    echo $vin

    cp ~/result机器识别结果/ori通过未篡改机器结果/一致/${vin}"_1.jpg" ~/image16000/一致15380对
    cp ~/result机器识别结果/ori通过未篡改机器结果/一致/${vin}"_2.jpg" ~/image16000/一致15380对
    let count+=1
    if (( "$count" >= "15380" ))
    then
        break
    fi
done

mkdir ~/image16000/不一致278对
count=0
vin=""
for line in `ls ~/result机器识别结果/npass_nori未通过且篡改机器结果/不一致`
do
    echo "通过且未篡改 1.18% 278对(不包含手动10对)"
    echo $count
    if [[ $line == *_1.jpg ]]
    then
        vin=`echo $line | cut -d '_' -f 1`
    else
        continue
    fi
    echo $vin

    cp ~/result机器识别结果/npass_nori未通过且篡改机器结果/不一致/${vin}"_1.jpg" ~/image16000/不一致278对
    cp ~/result机器识别结果/npass_nori未通过且篡改机器结果/不一致/${vin}"_2.jpg" ~/image16000/不一致278对
    let count+=1
    if (( "$count" >= "278" ))
    then
        break
    fi
done

mkdir ~/image16000/未识别332对
count=0
vin=""
for line in `ls ~/result机器识别结果/unrecongnize未识别机器结果/未识别`
do
    echo "通过且未篡改 332对"
    echo $count
    if [[ $line == *_1.jpg ]]
    then
        vin=`echo $line | cut -d '_' -f 1`
    else
        continue
    fi
    echo $vin

    cp ~/result机器识别结果/unrecongnize未识别机器结果/未识别/${vin}"_1.jpg" ~/image16000/未识别332对
    cp ~/result机器识别结果/unrecongnize未识别机器结果/未识别/${vin}"_2.jpg" ~/image16000/未识别332对
    let count+=1
    if (( "$count" >= "332" ))
    then
        break
    fi
done

