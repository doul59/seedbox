#!/bin/bash
kill_deluged=$(ps aux | grep deluged | grep -v grep | awk '{print $2}')
kill $kill_deluged
find /root/downloads/completed/Movies/ -mindepth 1 -maxdepth 1 ! -type l | while read line
do
name=$(echo $line | cut -d "/" -f6)
mv "$line" /root/acd/Movies/ && ln -s "/root/acd/Movies/$name" /root/downloads/completed/Movies/
done
/root/remount.sh
sleep 5
acd_cli sync
sleep 15
/usr/bin/python /usr/bin/deluged -d &
