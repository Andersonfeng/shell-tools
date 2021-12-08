#!/bin/sh

/usr/bin/sshpass -p anderson ssh -p 60022 admin@192.168.50.1 "/sbin/arp -s 192.168.50.228 74:D4:35:B2:ED:75;/sbin/arp -s 192.168.50.126 f8:32:e4:a4:75:9d;/sbin/arp -s 192.168.50.66 1C:1B:0D:01:90:5C"

#/usr/bin/sshpass -p anderson ssh admin@192.168.50.1 /var/opt/updateDdnsInRouter.sh
