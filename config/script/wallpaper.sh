#!/bin/sh

wallpaper () {
	wallpapers_path=~/.config/wallpaper/
	c=0
	for file in `ls ${wallpapers_path}`
	do
		filelist[$c]=${wallpapers_path}${file}
		((c++))
	done
	x=$((RANDOM%${#filelist[*]}))
	echo ${filelist[${x}]}
}
PID=$(ps -ef | grep swww | grep -v grep | awk '{print $2}')
if [ ! -Z "${PID}" ]; then
	swww kill
fi

swww init

WALLPAPER_PATH=$(wallpaper)

TEMP=$WALLPAPER_PATH

while true; do
	if [ $WALLPAPER_PATH = $TEMP ]
	then
		WALLPAPER_PATH=$(wallpaper)
	else
		TEMP=$WALLPAPER_PATH
		swww img --transition-type outer --transition-pos 0.854,0.977 --transition-step 90 ${WALLPAPER_PATH}
		sleep 900
	fi
done
