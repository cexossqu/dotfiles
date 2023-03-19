#!/bin/sh

# 将罗马数字转换为阿拉伯数字
function transform() {
  spaces=()
  for element in $@
  do
    tmp=0
    if [ $element == "I" ]; then
            tmp=1
    elif [ $element == "II" ]; then
            tmp=2
    elif [ $element == "III" ]; then
            tmp=3
    elif [ $element == "IV" ]; then
            tmp=4
    elif [ $element == "V" ]; then
            tmp=5
    elif [ $element == "VI" ]; then
            tmp=6
    elif [ $element == "VII" ]; then
            tmp=7
    elif [ $element == "VIII" ]; then
            tmp=8
    elif [ $element == "IX" ]; then
            tmp=9
    elif [ $element == "X" ]; then
            tmp=10
    fi
    spaces[${#spaces[@]}]=$tmp
  done
  echo ${spaces[*]}
}

