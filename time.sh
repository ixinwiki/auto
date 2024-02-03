#!/bin/bash

# 获取当前时间的小时和分钟
current_hour=$(date +"%H")
current_minute=$(date +"%M")

# 计算当前时间与最接近的6的倍数之间的时间差
remainder=$(((current_hour + 1) % 6))
hours_to_next_6=$((6 - remainder))
if [ $remainder -eq 0 ]; then
    hours_to_next_6=0
fi

# 计算分钟的时间差
if [ $current_minute -gt 0 ]; then
    minutes_to_next_6=$((60 - current_minute - 1))
else
    minutes_to_next_6=0
fi

# 输出时间差
echo "${hours_to_next_6}h ${minutes_to_next_6}m"
