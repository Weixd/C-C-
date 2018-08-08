#!/bin/bash

echo "ubuntu" | chmod 664 ~/image/*

# samba config 文件设置为 path = ~/image

echo "ubuntu" | sudo service smbd restart


