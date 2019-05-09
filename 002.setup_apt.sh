#!/bin/bash
#作者:DUGIGEEK
#日期:2018.12.08
#描述:使用国内软件源

#使用颜色打印函数
source ~/.colorc

set -e

show_help()
{
	THE_APP_NAME=002.setup_ap.sh
	pwarn "wrong params [WARNNING]"
	sinfo "Usage: $THE_APP_NAME version of ubuntu/mint"
	sinfo "$THE_APP_NAME 1 [for ubuntu14.04/mint17]"
	sinfo "$THE_APP_NAME 2 [for ubuntu16.04/mint18]"
	sinfo "$THE_APP_NAME 3 [for ubuntu18.04/mint19]"
	exit 1
}

update_aptsource()
{
	if [ -z "${THE_APT_VER}" ]; then
		show_help
	fi

	sudo cp aptfiles/${THE_APT_VER}/sources.list /etc/apt/
	if [ $? -ne 0 ]; then
		perro "failed update ${THE_APT_VER} apt source [ERROR]"
		exit 1
	else
		pdone "finish update ${THE_APT_VER} apt source [OK]"
	fi
	
	sinfo "start run apt-get update [START]"
	sudo apt-get update > /dev/null 2>&1
	if [ $? -ne 0 ]; then
		perro "failed run apt-get update [ERROR]"
	else
		pdone "finish run apt-get update [OK]"
	fi
}

main_proc()
{
	if [ "x$1" = "x1" ]; then
		export THE_APT_VER=14.04
		update_aptsource
	elif [ "x$1" = "x2" ]; then
		export THE_APT_VER=16.04
		update_aptsource
	elif [ "x$1" = "x3" ]; then
		export THE_APT_VER=18.04
		update_aptsource
	else
		show_help
	fi
}

main_proc $1
