#!/bin/zsh

pid=`ps -ef | grep ss-local | grep -v grep | awk '{print $2}'`

if [ ! -z "${pid}" ]; then
  exit 0
else
  nohup ss-local -c /home/xm/.config/shadowsocks/config.json &
  exit 0
fi
