#!/usr/bin/env bash

# this script aims at configuring a computer to run the FaMouS simulator

function error
{
    echo "${PROGNAME}: ${1:-"Unknown Error"}" 1>&2
    exit 1
}

# make sure the following dependencies have been installed 
echo The setup program of the USE Tracker is about to update your system
sudo apt-get -qq update
sudo apt-get -qq upgrade

echo
echo
echo "Installing Dependencies"
sudo apt-get install g++ libwxbase3.0-dev libopencv-dev libboost-program-options-dev libwxgtk3.0-dev libwxgtk-media3.0-dev freeglut3.0-dev libva-dev libbz2-dev libx264-dev || error "$LINENO: Aborted, could not install the required dependencies."

echo
echo
echo "Building USE Tracker
make release

# install images
sudo mkdir /usr/local/share/useTracker
sudo cp -a images /usr/share/useTracker/

# install program
sudo cp ./bin/Release/useTracker /usr/bin/

