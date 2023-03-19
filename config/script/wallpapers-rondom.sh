#!/bin/bash
#
# 设置随机壁纸
wallpapers_path=~/.config/wallpaper/

c=0
for file in `ls ${wallpapers_path}`
do
	filelist[$c]=${wallpapers_path}${file}
	((c++))
done

x=$((RANDOM%${#filelist[*]}))
echo ${filelist[${x}]}
