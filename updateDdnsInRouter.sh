#!/bin/bash

#定时重新绑定路由器Ddns

sshPassword=anderson
routeIp=192.168.50.1
routeUser=admin

server=$(/usr/bin/sshpass -p $sshPassword ssh $routeUser@$routeIp "nvram get ddns_server_x")
hostname="andersonfeng.asuscomm.com"
wanIp=$(/usr/bin/sshpass -p $sshPassword ssh $routeUser@$routeIp "nvram get wan0_ipaddr")
echo server:$server
echo wanIp:$wanIp

/usr/bin/sshpass -p $sshPassword ssh $routeUser@$routeIp "/usr/sbin/ez-ipupdate -S dyndns -a $wanIp -h $hostname -A 2 -s $server -e /sbin/ddns_updated -b /tmp/ddns.cache"
