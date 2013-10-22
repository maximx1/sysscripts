#!/bin/sh
TMP_WORKING_DIR=$(pwd)
cd ~/Games/Minecraft/
screen -dmS minecraft ~/Games/Minecraft/start_server.sh
cd $TMP_WORKING_DIR
