#!/bin/bash

#将unturned服务器的日志加上时间

tail -0f /var/log/unturned.log|
while read line ;
do
    time=$(date "+%Y-%m-%d %H:%M:%S ")
    echo "$time$line" |tee -a /var/log/unturned-with-time.log
done

