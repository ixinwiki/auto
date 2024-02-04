import datetime

current_time = datetime.datetime.now()

# 获取当前时间的小时、分钟和秒
current_hour = current_time.hour
current_minute = current_time.minute
current_second = current_time.second

# 计算当前时间与最接近的6的倍数之间的时间差
next_hour = 6 * (current_hour // 6 + 1)
if next_hour >= 24:
    next_hour = next_hour % 24

if next_hour < current_hour or (next_hour == current_hour and (current_minute > 0 or current_second > 0)):
    next_time = current_time.replace(hour=next_hour, minute=0, second=0) + datetime.timedelta(days=1)
else:
    next_time = current_time.replace(hour=next_hour, minute=0, second=0)

# 计算时间差
time_difference = next_time - current_time -  datetime.timedelta(seconds=30)
# 将时间差格式转换成小时、分钟和秒的格式
hours = time_difference.seconds // 3600
minutes = (time_difference.seconds % 3600) // 60
seconds = time_difference.seconds % 60

# 输出时间差格式
print(f"{hours}h {minutes}m {seconds}s")
