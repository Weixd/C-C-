#!/bin/bash


for line in `cat nanjing.sql`
do
    echo ${line:7}
done 
