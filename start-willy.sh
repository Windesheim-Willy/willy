#!/bin/bash

trap 'kill %1; kill %2; kill %3' SIGINT #Kill all processes if one recieves a kill signal
roscore & # Start the ros master
./components/navigation_stack/start-live-navstack.sh & # Start the nav stack
./components/lidar/run.sh # Start the lidar capture
# TODO start joystick
# TODO start motor driver
