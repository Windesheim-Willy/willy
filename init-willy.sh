#!/bin/bash

sudo chmod 777 /dev/willy_driver
#sudo chmod 777 /dev/willy_openmv
#sudo chmod 777 /dev/willy_sonar
sudo chmod 777 /dev/input/js0
sudo chmod 777 /dev/video0

CURDIR=$(pwd)
cd components/lidar
./init.sh
cd "$CURDIR"
./components/navigation_stack/init.sh
