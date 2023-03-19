#!/bin/sh
swayidle -w timeout 10 'swaylock -f -c 000000' timeout 20 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' before-sleep 'swaylock -f -c 000000' unlock 'eww open bar'
