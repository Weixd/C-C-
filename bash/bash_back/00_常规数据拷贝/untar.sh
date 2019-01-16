#!/bin/bash

# 
for ff in `ls *.tar`
do 
	set -x;
	tar xf ${ff}
	{ set +x; } 2>/dev/null	
done


