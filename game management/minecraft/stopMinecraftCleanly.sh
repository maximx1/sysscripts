#!/bin/sh
screen -p 0 -S minecraft -X eval 'stuff stop\015'
nohup java -cp "/home/justin/Games/Minecraft/" TSPListnerV2 &
