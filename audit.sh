#!/bin/bash

#This is for installing the auditing package
sudo apt-get install auditd
sudo auditd

#This adds a watch for any changes in the wellingtonClinic directory and
#any directory or file beneath it
sudo aduitctl -w opt/WellingtonClinic/ -p rwxa

#This is to display textual form of username attempting the command
aureport -i

cat /var/log/audit/audit.log

#this monitors and lists all object creations every 0.1 second on the
#wellingtonClinic directory
watch -n 0.1 ls /opt/WellingtonClinic/

#This command recursively watches and lists all events such as access, open, create and
#delete in the directory
inotifywait -m -r /opt/WellingtonClinic/
