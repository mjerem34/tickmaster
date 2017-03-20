#!/bin/bash

if mount -a; then
	echo "$(date) - ok"
else
	echo "$(date) - nok"
fi
