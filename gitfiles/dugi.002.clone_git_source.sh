#!/bin/bash
#作者:DUGIGEEK
#日期:2018.12.08
#描述:git的配置

#使用颜色打印函数
source ~/.colorc

#帮助函数
help ()
{
	pwarn "usage: ./2.clone_git_source.sh  [ipaddr/localhost] [project] [branch/bare]"
}

#第一个参数是源码库名称
if [ -z $1 ]; then
	perro "Please set git server address"
	help
	exit 1
else
	pdone "Get git server address: $1"
fi

#第二个参数是源码库地址，若是本机的/home/git目录则填写localhost
if [ -z $2 ]; then
	perro "Please set source name"
	help
	exit 1
else
	pdone "Get source name: $2"
fi

#第三个参数是分支名称,如果是源码空库使用bare
if [ -z $3 ]; then
	perro "Please set branch name"
	help
	exit 1
else
	pdone "Get branch name: $3"
fi

export GIT_SRV_ADDR=$1
export GIT_SRC_NAME=$2
export GIT_BRC_NAME=$3

export GIT_MASTER_FILE=.git/refs/heads/master

if [ -d ${GIT_SRC_NAME} ]; then
	perro "Get ${GIT_SRC_NAME} exist [ERROR]"
	exit 1
fi

if [ "x${GIT_BRC_NAME}" == "xbare" ]; then
	#源码空库的处理方法
	git clone git@${GIT_SRV_ADDR}:/home/git/src/${GIT_SRC_NAME}.git
	if [ $? -ne 0 ]; then
		perro "Clone git source bare [ERROR]"
		exit 1
	fi
	pdone "Clone git source bare [OK]"
	
	#如果不存在master分支则创建并递交一个master分支
	if [ ! -f ${GIT_MASTER_FILE} ]; then
		pwarn "Create master branch on ${GIT_SRC_NAME}  [START]"
		cd ${GIT_SRC_NAME}
		pecho "git.init" > git.init
		git add .
		git commit -m "git.init"
		git config --global push.default simple
		git push origin master
		cd -
		pdone "Create master branch on ${GIT_SRC_NAME}  [OK]"
	fi
	
else
	git clone git@${GIT_SRV_ADDR}:/home/git/src/${GIT_SRC_NAME}.git -b ${GIT_BRC_NAME}
	if [ $? -ne 0 ]; then
		perro "Clone git source brach: ${GIT_BRC_NAME} [ERROR]"
		exit 1
	fi
	pdone "Clone git source brach: ${GIT_BRC_NAME} [OK]"
fi


