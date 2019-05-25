#!/bin/bash

source /opt/ros/melodic/setup.bash
mkdir -p /ros_ws/src
cd /ros_ws
catkin build
source devel/setup.bash

roscore &
roslaunch vrep_unity_raven2 main.launch

# Entrypoint for command
exec "$@"