#!/bin/bash
declare -A screen_dict

screen_dict=(
#["bedrock-server"]="cd /usr/local/bedrock-server-1.14.1.4 && ./bedrock_server 2>&1|tee -a /var/log/bedrock_server.log"
["frp"]="cd /opt/frp/frp_0.38.0_linux_amd64 && ./frps -c frps.ini 2>&1|tee -a /var/log/frp.log"
["monitorFrpLog"]="/opt/shell-tools/monitorFrpLog.sh |& tee -a /var/log/monitorFrp.log"
["tomcat"]="/opt/apache-tomcat-9.0.19/bin/startup.sh"
["vpnserver"]="/opt/vpnserver/vpnserver/vpnserver start"
#["udp2raw"]="/opt/udp2raw/udp2raw_amd64 -c -l0.0.0.0:30001 -r104.238.160.103:4096 -k 'anderson' 2>&1|tee -a /var/log/udp2raw.log"
[#"kcptun"]="/opt/kcptun/client_linux_amd64 -l :30000 -r 127.0.0.1:30001 --crypt salsa20 --key anderson --nocomp |& tee -a /var/log/kcptun.log"
# ["dst"]="cd /var/opt/steamLibrary/dontStarveTogetherDedicatedServer/bin && ./dontstarve_dedicated_server_nullrenderer ~/.klei/DoNotStarveTogether 2>&1|tee -a /var/log/dst.log"
# ["unturned"]="/var/opt/steamLibrary/unturned/Unturned_Headless.x86_64 -nographics -nographics -batchmode -silent-crashes +secureserver double_horse 2>&1| tee -a /var/log/unturned.log"
# ["monitorUnturnedLog"]="/var/opt/shell/monitorUnturnedLog.sh"
# ["7dtd"]="/var/opt/steamLibrary/7_days_to_die_server/startserver.sh -configfile=/var/opt/steamLibrary/7_days_to_die_server/serverconfig.xml"
)
for key in ${!screen_dict[@]};
do 
	screen_name=$key
	screen_command=${screen_dict[$key]}
	screen -dmS $screen_name
	screen -X -S $screen_name stuff "$screen_command"
	screen -X -S $screen_name stuff "\n"
done

# open video stream when start up (in case shutdown by accident)
echo $(date +\%Y\%m\%d-\%H\%M\%S) |xargs -I % sh -c "ffmpeg -i rtsp://admin:haikang401@192.168.50.14/h265/ch1/main/av_stream -c:v copy -t 1800 -y /d/ftp/haikang/14_%.mkv && ffmpeg -i /d/ftp/haikang/14_%.mkv -codec copy -y /d/ftp/haikang/14_%.mp4 && rm -f /d/ftp/haikang/14_%.mkv"
echo $(date +\%Y\%m\%d-\%H\%M\%S) |xargs -I % sh -c "ffmpeg -i rtsp://admin:haikang401@192.168.50.50/h265/ch1/main/av_stream -c:v copy -t 1800 -y /d/ftp/haikang/50_%.mkv && ffmpeg -i /d/ftp/haikang/50_%.mkv -codec copy -y /d/ftp/haikang/50_%.mp4 && rm -f /d/ftp/haikang/50_%.mkv"
