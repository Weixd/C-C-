#!/bin/bash

cd
mkdir master_image

echo "emdata#2018" | sudo -S mount /dev/sdc1 ~/master_image/
