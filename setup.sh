#!/bin/bash
if [[ $UID -lt 0 ]]
then
	echo "ERROR: Please run as root!"
	exit
fi
cat src/conndom.bash > /usr/bin/conndom
chmod +x /usr/bin/conndom
echo "OK: Install success!"
