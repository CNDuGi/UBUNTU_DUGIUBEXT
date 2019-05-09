#!/bin/bash
source ~/.colorc
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
fo_install()
{
	pwarn "Install $1 [START]"
    sudo apt-get install -y $1 --force-yes > /dev/null 2>&1
    if [ $? -eq 0 ]; then
		pdone "Install $1  [OK]"
	else
		perro "Install $1  [ERROR]"
		exit 1
	fi
}
do_install gcc-4.8
do_install g++-4.8
do_install gcc-4.8-multilib
do_install g++-4.8-multilib
sudo update-alternatives  --install /usr/bin/g++ g++     /usr/bin/g++-4.8 50
if [ $? -eq 0 ]; then
	pdone "Update default g++ version: 4.8 [OK]"
else
	pdone "Update default g++ version: 4.8 [ERROR]"
	exit 1
fi

sudo update-alternatives  --install /usr/bin/gcc gcc     /usr/bin/gcc-4.8 50
if [ $? -eq 0 ]; then
	pdone "Update default gcc version: 4.8 [OK]"
else
	pdone "Update default gcc version: 4.8 [ERROR]"
	exit 1
fi

sudo update-alternatives  --install /usr/bin/cpp cpp-bin /usr/bin/cpp-4.8 50
if [ $? -eq 0 ]; then
	pdone "Update default cpp version: 4.8 [OK]"
else
	pdone "Update default cpp version: 4.8 [ERROR]"
	exit 1
fi
