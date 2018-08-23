#!/bin/bash

cd ~
mkdir mount_image

echo "emdata#2018" | sudo -S mount -t cifs -o username=public,password=emdata#2018, -l //192.168.100.86/vin/ ./mount_image/
