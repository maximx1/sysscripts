#!/bin/sh
awk '{printf "%3.1fC\n", $1/1000}' /sys/class/thermal/thermal_zone0/temp
