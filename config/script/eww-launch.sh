#!/bin/sh

PID=$(ps -ef | grep eww | grep -v grep | grep './eww daemon' | awk '{print $2}')

if [ ! -z "${PID}" ]; then
	~/bin/eww close-all && killall eww
fi

eww daemon
sleep 1
eww open bar

