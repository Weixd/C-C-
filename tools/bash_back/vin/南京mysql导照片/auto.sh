#!/bin/bash

while read line
do
	cp /opt/vin_compare/photo/$line* ./
done < file.txt
