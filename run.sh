#!/bin/bash

PROJECT_ROOT="$(pwd)"
VERSION=0.1

# Download binary from Github releases
# TODO: upload binaries to github releases page
if [ "$(uname)" == "Darwin" ]; then
    # Download Mac OS X executable
    echo "Downloading executable for Mac OS X platform"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Download GNU/Linux executable
    echo "Downloading executable for Linux platform"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    # Download 32 bits Windows NT executable
    echo "Downloading executable for Windows platform"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
    # Download 64 bits Windows NT executable
    echo "Downloading executable for Windows platform"
fi

# Run ROS with Docker
# docker-compose up -d

# Run V-REP
if [[ -z "${VREP_PATH}" ]]; then
    echo "Could not find VREP executable. Please specify VREP_PATH variable"
else
    ${VREP_PATH}/vrep.sh ${PROJECT_ROOT}/vrep-raven2/raven2-simple.ttt &
fi

# Run the executable
if [ "$(uname)" == "Darwin" ]; then
    # Run Mac OS X executable
    echo "Running Mac OS X Unity executable"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Run GNU/Linux executable
    echo "Running Linux Unity executable"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    # Run 32 bits Windows NT executable
    echo "Running Windows Unity executable"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
    # Run 64 bits Windows NT executable
    echo "Running Windows Unity executable"
fi
# ./unity-raven2/Builds/linux/raven2.x86_64