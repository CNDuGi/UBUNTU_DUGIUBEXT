#!/bin/bash
#作者:DUGIGEEK
#日期:2018.12.08
#描述:创建一个git源码空库

#使用颜色打印函数
source ~/.colorc

#需要给定源码库名称
if [ -z $1 ]; then
	pwarn "Please set git bare name"
	exit 1
fi

#如果源码顶层目录不存在则创建
if [ ! -d src ]; then
	sudo mkdir src
	sudo chown -R git:git src
	pdone "Create git bare source root [OK]"
fi

#开始创建源码空库
cd src
sudo git init --bare $1.git
if [ $? -ne 0 ]; then
	perro "Create git bare source [ERROR]"
	exit 1
fi
pdone "Create git bare source done!"

#将创建的源码空库所有者修改为git
sudo chown -R git:git $1.git

#回到先前目录
cd - > /dev/null
pdone "Create git bare source: $1.git [OK]"
exit 0
