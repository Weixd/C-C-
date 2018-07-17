#!/bin/bash

for line in `cat ~/0204_pass.txt`
do
    cp "~/source/path/"${line:38} $HOME/pass
done

for line in `cat ~/0204_not_pass.txt`
do
    cp "~/source/path/"${line:38} $HOME/notpass
done
