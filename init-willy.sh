#!/bin/bash

sudo chmod 777 /dev/willy_driver
sudo chmod 777 /dev/input/js0

CURDIR=$(pwd)
cd components/lidar
./init.sh
cd "$CURDIR"
