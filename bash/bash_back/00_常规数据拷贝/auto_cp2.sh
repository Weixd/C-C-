#!/bin/bash

while read line
do
    id=${line:0:28}
    clsbdh=${line:29}

    cp /opt/vin_compare/photo/${id}_1.jpg ./${id%_1.jpg}_${clsbdh}_1.jpg
    cp /opt/vin_compare/photo/${id}_2.jpg ./${id%_2.jpg}_${clsbdh}_2.jpg

done < file.txt
