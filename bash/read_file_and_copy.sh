#!/bin/bash

for line in `cat ~/0204_pass.txt`
do
    cp "/home/public/0204_chongqing/2018-07-10/"${line:38} $HOME/pass0204
done

for line in `cat ~/0204_not_pass.txt`
do
    cp "/home/public/0204_chongqing/2018-07-10/"${line:38} $HOME/notpass0204
done
