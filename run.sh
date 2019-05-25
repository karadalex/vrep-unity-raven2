#!/bin/bash

# Download binary from Github releases
# TODO: upload binaries to github releases page

# Run ROS with Docker
docker-compose up -d

# Run V-REP
PWD="$(pwd)"
if [[ -z "${VREP_PATH}" ]]; then
    echo "Could not find VREP executable. Please specify VREP_PATH variable"
else
    ${VREP_PATH}/vrep.sh ${PWD}/vrep-raven2/raven2-simple.ttt &
fi

# Run the executable
./unity-raven2/Builds/linux/raven2.x86_64