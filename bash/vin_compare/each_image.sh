#!/bin/bash

count=1
for line in `cat ~/result机器识别结果/npass_nori通过且篡改机器结果/thread0.csv`
do
    result=""
    if [ "$count" -eq "1" ]
    then
        echo $count
        let count++
        continue
    fi
    if [[ $line == *_1.jpg ]]
    then
        image1=$line
        echo $image1
    fi
    
    if [[ $line == *_2.jpg,* ]]
    then
        image2=`echo $line | cut -d ',' -f 1`
        result=`echo $line | cut -d ',' -f 2`
        echo $image2
        echo $result
    fi

    if [ "$result" == "不一致" ]
    then
        `cp ~/rg_image/npass_nori/$image1 ~/result机器识别结果/npass_nori通过且篡改机器结果/不一致`
        `cp ~/rg_image/npass_nori/$image2 ~/result机器识别结果/npass_nori通过且篡改机器结果/不一致`
    fi

    if [ "$result" == "未识别" ]
    then
        `cp ~/rg_image/npass_nori/$image1 ~/result机器识别结果/npass_nori通过且篡改机器结果/未识别`
        `cp ~/rg_image/npass_nori/$image2 ~/result机器识别结果/npass_nori通过且篡改机器结果/未识别`
    fi

    if [ "$result" == "结果一致" ]
    then
        `cp ~/rg_image/npass_nori/$image1 ~/result机器识别结果/npass_nori通过且篡改机器结果/一致`
        `cp ~/rg_image/npass_nori/$image2 ~/result机器识别结果/npass_nori通过且篡改机器结果/一致`
    fi
done

count=1
for line in `cat ~/result机器识别结果/npass_nori通过且篡改机器结果/thread1.csv`
do
    result=""
    if [ "$count" -eq "1" ]
    then
        echo $count
        let count++
        continue
    fi
    if [[ $line == *_1.jpg ]]
    then
        image1=$line
        echo $image1
    fi
    
    if [[ $line == *_2.jpg,* ]]
    then
        image2=`echo $line | cut -d ',' -f 1`
        result=`echo $line | cut -d ',' -f 2`
        echo $image2
        echo $result
    fi

    if [ "$result" == "不一致" ]
    then
        `cp ~/rg_image/npass_nori/$image1 ~/result机器识别结果/npass_nori通过且篡改机器结果/不一致`
        `cp ~/rg_image/npass_nori/$image2 ~/result机器识别结果/npass_nori通过且篡改机器结果/不一致`
    fi

    if [ "$result" == "未识别" ]
    then
        `cp ~/rg_image/npass_nori/$image1 ~/result机器识别结果/npass_nori通过且篡改机器结果/未识别`
        `cp ~/rg_image/npass_nori/$image2 ~/result机器识别结果/npass_nori通过且篡改机器结果/未识别`
    fi

    if [ "$result" == "结果一致" ]
    then
        `cp ~/rg_image/npass_nori/$image1 ~/result机器识别结果/npass_nori通过且篡改机器结果/一致`
        `cp ~/rg_image/npass_nori/$image2 ~/result机器识别结果/npass_nori通过且篡改机器结果/一致`
    fi
done

count=1
for line in `cat ~/result机器识别结果/npass_nori通过且篡改机器结果/thread2.csv`
do
    result=""
    if [ "$count" -eq "1" ]
    then
        echo $count
        let count++
        continue
    fi
    if [[ $line == *_1.jpg ]]
    then
        image1=$line
        echo $image1
    fi
    
    if [[ $line == *_2.jpg,* ]]
    then
        image2=`echo $line | cut -d ',' -f 1`
        result=`echo $line | cut -d ',' -f 2`
        echo $image2
        echo $result
    fi

    if [ "$result" == "不一致" ]
    then
        `cp ~/rg_image/npass_nori/$image1 ~/result机器识别结果/npass_nori通过且篡改机器结果/不一致`
        `cp ~/rg_image/npass_nori/$image2 ~/result机器识别结果/npass_nori通过且篡改机器结果/不一致`
    fi

    if [ "$result" == "未识别" ]
    then
        `cp ~/rg_image/npass_nori/$image1 ~/result机器识别结果/npass_nori通过且篡改机器结果/未识别`
        `cp ~/rg_image/npass_nori/$image2 ~/result机器识别结果/npass_nori通过且篡改机器结果/未识别`
    fi

    if [ "$result" == "结果一致" ]
    then
        `cp ~/rg_image/npass_nori/$image1 ~/result机器识别结果/npass_nori通过且篡改机器结果/一致`
        `cp ~/rg_image/npass_nori/$image2 ~/result机器识别结果/npass_nori通过且篡改机器结果/一致`
    fi
done

count=1
for line in `cat ~/result机器识别结果/npass_nori通过且篡改机器结果/thread3.csv`
do
    result=""
    if [ "$count" -eq "1" ]
    then
        echo $count
        let count++
        continue
    fi
    if [[ $line == *_1.jpg ]]
    then
        image1=$line
        echo $image1
    fi
    
    if [[ $line == *_2.jpg,* ]]
    then
        image2=`echo $line | cut -d ',' -f 1`
        result=`echo $line | cut -d ',' -f 2`
        echo $image2
        echo $result
    fi

    if [ "$result" == "不一致" ]
    then
        `cp ~/rg_image/npass_nori/$image1 ~/result机器识别结果/npass_nori通过且篡改机器结果/不一致`
        `cp ~/rg_image/npass_nori/$image2 ~/result机器识别结果/npass_nori通过且篡改机器结果/不一致`
    fi

    if [ "$result" == "未识别" ]
    then
        `cp ~/rg_image/npass_nori/$image1 ~/result机器识别结果/npass_nori通过且篡改机器结果/未识别`
        `cp ~/rg_image/npass_nori/$image2 ~/result机器识别结果/npass_nori通过且篡改机器结果/未识别`
    fi

    if [ "$result" == "结果一致" ]
    then
        `cp ~/rg_image/npass_nori/$image1 ~/result机器识别结果/npass_nori通过且篡改机器结果/一致`
        `cp ~/rg_image/npass_nori/$image2 ~/result机器识别结果/npass_nori通过且篡改机器结果/一致`
    fi
done

