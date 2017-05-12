#!/bin/bash

if cd /home/ticket/Bureau/TickMasterV2/; then
	echo "$(date) - cd ok"
else
	echo "$(date) - can't do cd"
fi

if puma -e production -d; then
	echo "$(date) - puma started"
else
	echo "$(date) - can't start puma"
fi
