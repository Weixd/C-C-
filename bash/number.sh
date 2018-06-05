#!/bin/bash

a=1234
echo ${a}

let "a+=1"
echo ${a}

#将a中的12替换为BB，然后将新的值给b
b=${a/12/BB}
echo ${b}

let "b+=1"
echo ${b}    # Output:1

c=BB34
echo ${c}    # output: BB34

d=${c/BB/12} # 将BB替换为12
echo ${d}    # output: 1234

let "d+=1"
echo ${d}    # output: 1235
