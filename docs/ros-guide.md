How to run ROS
==============

## On Ubuntu

Make sure you have properly installed and configured:
- ROS [http://www.ros.org/install/](http://www.ros.org/install/)
- catkin_tools [https://catkin-tools.readthedocs.io/en/latest/installing.html](https://catkin-tools.readthedocs.io/en/latest/installing.html)

Then go to the `ros` directory of this project and run
```
catkin build
source devel/setup.bash
roslaunch vrep_unity_raven2 main.launch
```

## Anywhere else with Docker

Make sure you have `docker` and `docker-compose` installed.
In the root of this repository run
```
docker-compose up
```