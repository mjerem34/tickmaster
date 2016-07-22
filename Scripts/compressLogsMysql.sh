#!/bin/bash

echo "$(date) - shutdown mysql server"
if service mysql stop; then
	echo "$(date) - service stopped"
else
	echo "$(date) - can't stop service mysql"
fi


echo "$(date) - Kill processes of mysql processus"
if kill -9 $(pgrep -f mysql); then
	echo "$(date) - Kill ok mysql down... Fxck mysql !!"
else
	echo '$(date) - Kill not working, maybe you do not have the sudo rights, maybe ...'
fi


echo '$(date) - Move on mysql log directory'
if cd /var/log/mysql/; then
	echo '$(date) - Moved'
else
        echo '$(date) - Moved not working, maybe you do not have the sudo rights'
fi


echo '$(date) - compressing...'
if tar jcf `date +"%Y-%m-%d"`.log.tar.bz2 *.log; then
	echo "$(date) - Compressing ok ..."
else
	echo "$(date) - Compression not working, I don't know why ..."
fi

echo "$(date) - Move the compressed save logfile to /media/Systemback/mysql/logs"
if mv *.log.tar.bz2 /media/Systemback/mysql/logs/; then
	echo "$(date) - Logs compressed moved ok"
else
	echo "$(date) - Can't move logs compressed"
fi

echo "$(date) - Remove the last log file"
if rm *.log; then
	echo "$(date) - Remove ok"
else
	echo "$(date) - I can't remove that bitch of log file ! you gave me the rights ?"
fi

echo "$(date) - create new files error.log, mysql.log, mysql-slow.log"
if touch error.log mysql.log mysql-slow.log; then
	echo "$(date) - files created"
else
	echo "$(date) - can't create files"
fi

echo "$(date) - chmod the files in 777 mode"
if chmod 777 error.log mysql.log mysql-slow.log; then
	echo "$(date) - chmoded"
else
	echo "$(date) - can't chmod"
fi

echo "$(date) - starting the mysql process"
if /bin/bash -l -c "service mysql start"; then
	echo "$(date) - start of mysql ok "
else
	echo "$(date) - can't start mysql, have you the rights ?"
fi

find /media/Systemback/mysql/sauvegardeBDD/ -type f -mtime +6 -delete


exit 0
