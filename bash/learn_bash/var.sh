#!/bin/bash


num1=10
num2=8
expr ${num1} + ${num2} # 格式: expr 操作数 运算符 操作数       运算符可以直接输出
expr ${num1} - ${num2}
expr ${num1} \* ${num2}
echo $[${num1} * ${num2}] # 格式: $[操作数 运算符 操作数]     需要用echo输出
echo $[${num1} / ${num2}]

echo "自增加 自减"
let num1++
echo ${num1}
let num1+=10
echo ${num1}
let num2--
echo ${num2}
let num2-=5
echo ${num2}

echo "随机数"
echo $RANDOM
echo $[${RANDOM}%100] # 100 以内随机数

echo "生成数字序列"
echo "seq 首数 末数, seq 首数 增量 末数"
seq 5
seq 2 5
seq 5 2 10

echo "小数处理"
echo "45.67-21.05" | bc
echo "scale=4;10/3"| bc # scale限制小数点位数
