#!/bin/bash

#echo "emdate#2018" | sudo -S apt-get install samba smbclient -y

echo "emdata#2018" | sudo -S service smbd restart

echo "smbd restarted"
