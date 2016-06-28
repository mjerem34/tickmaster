#!/bin/bash

if cd /home/ticket/Bureau/tickmaster/log/; then
        echo "cd ok"
else
        echo "can't change directory to /home/ticket/Bureau/tickmaster/log/"
fi

if tar jcf `date +"%Y-%m-%d"`.log.tar.bz2 *.log; then
        echo "tar the file ok"
else
        echo "can't tar the logs"
fi


if mv *.log.tar.bz2 /media/Systemback/TickMaster/logs/`date +"%Y-%m-%d"`.log.tar.bz2; then
        echo "logs files compressed moved on /media/Systemback/TickMaster/logs/"
else
        echo "can't moved the log files compressed"
fi

if rm *.log; then
        echo  "old log files removed"
else
        echo "can't remove old logs files"
fi

if touch production.log; then
        echo "new log files created"
else
        echo "can't create new logs files"
fi

if chmod 777 production.log; then
        echo "chmod of files ok"
else
        echo "can't do chmod in files"
fi
if bundle exec pumactl -F /home/ticket/Bureau/tickmaster/config/puma.rb restart; then
        echo "restart of puma ok!"
else
        echo "can't restart puma"
fi
