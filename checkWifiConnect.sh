#!/bin/bash

date >> /var/log/checkWifiConnection.log
ping 192.168.50.1 -c 1 1>&2 >> /var/log/checkWifiConnection.log
if [ $? != 0 ]; then
	usb_modeswitch -KW -v 0bda -p 1a2b
	nmcli d wifi connect ASUS_5G password 12345678 iface wlx508965145943 >> /var/log/checkWifiConnection.log
fi
