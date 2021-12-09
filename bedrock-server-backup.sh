#!/bin/sh

#定时删除并备份我的世界 Double Horse 世界数据

rm -rf /var/opt/bedrock-server-backup/*$(date "+%Y-%m-%d-%H" -d '-6 hour')*


7z a -t7z -r /var/opt/bedrock-server-backup/bedrock-server-worlds-backup-$(date "+%Y-%m-%d-%H-%M-%S").7z /usr/local/bedrock-server-1.14.1.4/worlds/Double\ Horse/*

