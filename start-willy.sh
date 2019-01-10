#!/bin/bash

trap 'killall' INT

killall() {
	for pid in run/*.pid; do start-stop-daemon --stop --pidfile "$pid" --remove-pidfile ; done
}

start-stop-daemon --start --pidfile run/roscore.pid --make-pidfile --exec /opt/ros/kinetic/bin/roscore &
sleep 2 && start-stop-daemon --start --pidfile run/lidar.pid --make-pidfile --exec $(pwd)/components/lidar/run.sh &
sleep 2 && start-stop-daemon --start --pidfile run/lidar_filter.pid --make-pidfile --exec /opt/ros/kinetic/bin/roslaunch -- $(pwd)/components/navigation_stack/filter.launch path:=$(pwd)/components/navigation_stack &
sleep 2 && start-stop-daemon --start --pidfile run/nav_stack.pid --make-pidfile --exec /opt/ros/kinetic/bin/roslaunch -- $(pwd)/components/navigation_stack/navigation.launch path:=$(pwd)/components/navigation_stack &
sleep 2 && start-stop-daemon --start --pidfile run/joystick.pid --make-pidfile --exec /opt/ros/kinetic/bin/roslaunch -- $(pwd)/components/keyboard/launch/teleop.launch &
sleep 2 && start-stop-daemon --start --pidfile run/motor_driver.pid --make-pidfile --exec /opt/ros/kinetic/bin/rosrun -- rosserial_python serial_node.py _port:=/dev/willy_driver &
sleep 2 && source $(pwd)/components/human_detection/devel/setup.bash && start-stop-daemon --start --pidfile run/huamn_detect.pid --make-pidfile --exec /opt/ros/kinetic/bin/roslaunch -- $(pwd)/components/human_detection/src/human_detection/src/launch/human_detection.launch > /dev/null &

# this holds the console busy reading.. when pressing ctrl + c the killall method will be executed
cat
