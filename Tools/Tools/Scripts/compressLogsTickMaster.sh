#!/bin/bash

if cd /home/ticket/Bureau/TickMasterV2/public/log/; then
	echo "$(date) - cd ok"
else
	echo "$(date) - can't change directory to /home/ticket/Bureau/TickMasterV2/log/"
fi

if tar jcf `date +"%Y-%m-%d"`.log.tar.bz2 *.log; then
	echo "$(date) - tar the file ok"
else
	echo "$(date) - can't tar the logs"
fi


if mv *.log.tar.bz2 /media/Systemback/TickMaster/logs/`date +"%Y-%m-%d"`.log.tar.bz2; then
	echo "$(date) - logs files compressed moved on /media/Systemback/TickMaster/logs/"
else
	echo "$(date) - can't moved the log files compressed"
fi

if rm *.log; then
	echo  "$(date) - old log files removed"
else
	echo "$(date) - can't remove old logs files"
fi

if touch puma.stdout.log; then
	echo "$(date) - new log files created"
else
	echo "$(date) - can't create new logs files"
fi

if touch puma.stderr.log; then
        echo "$(date) - new log files created"
else
        echo "$(date) - can't create new logs files"
fi


if chmod 777 puma.stdout.log; then
	echo "$(date) - chmod of files ok"
else
	echo "$(date) - can't do chmod in files"
fi

if chmod 777 puma.stderr.log; then
        echo "$(date) - chmod of files ok"
else
        echo "$(date) - can't do chmod in files"
fi


if rvmsudo bundle exec pumactl -F /home/ticket/Bureau/TickMasterV2/config/puma.rb restart; then
	echo "$(date) - restart of puma ok!"
else
	echo "$(date) - can't restart puma"
fi
