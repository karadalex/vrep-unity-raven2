FROM ros:melodic

RUN apt-get update
RUN apt-get install -y ros-melodic-rosbridge-server wget
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list' && \
    wget http://packages.ros.org/ros.key -O - | apt-key add - && \
    apt-get update && \
    apt-get install -y python-catkin-tools

EXPOSE 9090

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
# CMD bash