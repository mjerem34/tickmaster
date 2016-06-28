#!/bin/bash

if cd /home/ticket/Bureau/tickmaster/; then
        echo "cd ok"
else
        echo "can't do cd"
fi

if puma -e production -d; then
        echo "puma started"
else
        echo "can't start puma"
fi
