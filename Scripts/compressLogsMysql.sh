#!/bin/bash

echo "shutdown mysql server"
if sudo service mysql stop; then
        echo "service stopped"
else
        echo "can't stop service mysql"
fi

echo "Kill processes of mysql processus"
if sudo kill -9 $(pgrep -f mysql); then
        echo "Kill ok mysql down... Fxck mysql !!"
else
        echo 'Kill not working, maybe you do not have the sudo rights, maybe ...'
fi


echo 'Move on mysql log directory'
if cd /var/log/mysql/; then
        echo 'Moved'
else
        echo 'Moved not working, maybe you do not have the sudo rights'
fi

echo 'compressing...'
if tar jcf `date +"%Y-%m-%d"`.log.tar.bz2 *.log; then
        echo "Compressing ok ..."
else
        echo "Compression not working, I don't know why ..."
fi

echo "Move the compressed save logfile to /media/Systemback/mysql/logs"
if mv *.log.tar.bz2 /media/Systemback/mysql/logs/; then
        echo "Logs compressed moved ok"
else
        echo "Can't move logs compressed"
fi

echo "Remove the last log file"
if rm *.log; then
        echo "Remove ok"
else
        echo "I can't remove that bitch of log file ! you gave me the rights ?"
fi

echo "create new files error.log, mysql.log, mysql-slow.log"
if touch error.log mysql.log mysql-slow.log; then
        echo "files created"
else
        echo "can't create files"
fi

echo "chmod the files in 777 mode"
if chmod 777 error.log mysql.log mysql-slow.log; then
        echo "chmoded"
else
        echo "can't chmod"
fi
echo "starting the mysql process"
if sudo service mysql start; then
        echo "start of mysql ok "
else
        echo "can't start mysql, have you the rights ?"
fi

find /media/Systemback/mysql/sauvegardeBDD/ -type f -mtime +6 -delete


exit 0
