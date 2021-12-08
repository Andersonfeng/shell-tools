#!/bin/bash

#判断frp日志是否断开和连接,并根据关键字发邮件提醒

listenString="listener is closed"

tail -0f /var/log/frp.log |
while read line ;
do
	if [[ $line == *"listener is closed"* ]] && [[ $line == *"[mstsc]"* ]] ;
	then		
		sendEmail \
		-xu 1250046725@qq.com \
		-xp kjtfznenaneeghae \
		-u "frp邮件提醒" \
		-m $line \
		-t 593866511@qq.com \
		-s smtp.qq.com \
		-f 1250046725@qq.com

		echo "send mail : $line"
	fi
	if [[ $line == *"new proxy"* ]] && [[ $line == *"[mstsc]"* ]] ;
	then
                sendEmail \
		-xu 1250046725@qq.com \
		-xp kjtfznenaneeghae \
		-u "frp邮件提醒" \
		-m $line \
		-t 593866511@qq.com \
		-s smtp.qq.com \
		-f 1250046725@qq.com

		echo "send mail : $line"
	fi

done
