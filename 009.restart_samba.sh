#!/bin/bash
source ~/.colorc
sudo /etc/init.d/smbd restart
if [ $? -eq 0 ]; then
	pdone "Restart smbd  [OK]"
else
	perror "Restart smbd  [ERROR]"
	exit 1
fi

