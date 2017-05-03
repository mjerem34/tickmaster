#!/bin/sh
# /etc/init.d/tightvncserver
# Set the VNCUSER variable to the name of the user to start tightvncserver under
VNCUSER='ticket'
VNCUSER1='vnc'

case "$1" in
  start)
    su $VNCUSER -c '/usr/bin/tightvncserver :1'
    echo "$(date) - Starting TightVNC server for $VNCUSER"
    su $VNCUSER1 -c '/usr/bin/tightvncserver :2'
    echo "$(date) - Starting TightVNC server for $VNCUSER1"
    ;;
  stop)
    pkill Xtightvnc
    echo "$(date) - Tightvncserver stopped"
    ;;
  *)
    echo "$(date) - Usage: /etc/init.d/tightvncserver {start|stop}"
    exit 1
    ;;
esac
exit 0
