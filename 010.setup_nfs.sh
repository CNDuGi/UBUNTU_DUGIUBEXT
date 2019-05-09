#!/bin/bash
#作者:DUGIGEEK
#日期:2018.12.08
#描述:samba配置

#使用颜色打印函数
source ~/.colorc


export NFSSHARE_PATH=/nfsshare

set -e 

pinfo "Install nfsshare [START]"
do_install()
{
	pwarn "Install $1 [START]"
    sudo apt-get install -y $1 > /dev/null 2>&1
    if [ $? -eq 0 ]; then
		pdone "Install $1  [OK]"
	else
		perro "Install $1  [ERROR]"
		exit 1
	fi
}

do_install nfs-common

do_install nfs-kernel-server

if [ ! -e  ${NFSSHARE_PATH} ]; then
	sudo mkdir -p ${NFSSHARE_PATH}
	sudo chmod 777 ${NFSSHARE_PATH}
fi

sudo cp ./nfsfiles/exports /etc/exports

pdone "Install nfsshare [OK]"

sudo service nfs-kernel-server restart
if [ $? -eq 0 ]; then
	pdone "Restart NFS Server [OK]"
	sudo showmount -e localhost
else
	perro "Restart NFS Server [ERROR]"
fi
