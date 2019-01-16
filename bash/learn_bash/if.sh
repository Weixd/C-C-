#!/bin/bash

if [ 2 > 1 ]
then
	echo "2>1"
fi

if [ 1 == 2 ]
then
	echo "yes"
else
	echo "no"
fi

if [ 2 == 3 ]
then
	echo "2 == 2"
elif [ 1 != 1 ]
then
	echo "test2"
	echo "test2"
else
	echo "noting."
fi
