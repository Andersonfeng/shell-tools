#!/bin/sh

echo $(date +\%Y\%m\%d-\%H\%M) |xargs -I % sh -c "ffmpeg -i rtsp://admin:haikang401@192.168.50.14/h265/ch1/main/av_stream -c:v copy -t 1800 -y /d/ftp/haikang/14_%.mkv && ffmpeg -i /d/ftp/haikang/14_%.mkv -codec copy -y /d/ftp/haikang/14_%.mp4 && rm -f /d/ftp/haikang/14_%.mkv" &
echo $(date +\%Y\%m\%d-\%H\%M) |xargs -I % sh -c "ffmpeg -i rtsp://admin:haikang401@192.168.50.50/h265/ch1/main/av_stream -c:v copy -t 1800 -y /d/ftp/haikang/50_%.mkv && ffmpeg -i /d/ftp/haikang/50_%.mkv -codec copy -y /d/ftp/haikang/50_%.mp4 && rm -f /d/ftp/haikang/50_%.mkv" &
echo $(date +\%Y\%m\%d-\%H\%M) |xargs -I % sh -c "ffmpeg -i rtsp://admin:haikang401@192.168.50.15/h265/ch1/main/av_stream -c:v copy -t 1800 -y /d/ftp/haikang/15_%.mkv && ffmpeg -i /d/ftp/haikang/15_%.mkv -codec copy -y /d/ftp/haikang/15_%.mp4 && rm -f /d/ftp/haikang/15_%.mkv" &

