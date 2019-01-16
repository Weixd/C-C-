#!/bin/bash

for line int `cat filelist.txt`
do
    echo FILE:$line
    scp "public@192.168.204.61:${line}" ./0348_error
done
