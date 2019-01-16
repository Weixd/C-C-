#!/bin/bash

while read line
do
cp ~/251_back/01.chejianxianchang/21.南京车管所/码模/photo20181127/photo/$line* ./
done < file.txt
