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
pwarn "Instal tools [START]"
do_install vim
do_install cscope
do_install ctags
do_install build-essential
do_install zlib1g
do_install zlib1g-dev
do_install openssl
do_install libssl-dev
do_install libstdc++6
#do_install lib32stdc++6
do_install ncurses-dev
do_install libncurses5
do_install libncurses5-dev
#do_install lib32ncurses5
#do_install lib32ncurses5-dev
do_install flex
do_install automake
do_install autoconf
do_install gawk
do_install make
do_install gettext
do_install texinfo
do_install python-dev
do_install mtd-utils
do_install binutils
do_install u-boot-tools
do_install patch
do_install zip
do_install unzip
do_install bzip2
do_install libz-dev
#fo_install lib32z1
#fo_install lib32z1-dev
do_install bison
do_install gperf
do_install lzop
do_install zlib1g-dev
do_install xz-utils
do_install diffstat
do_install chrpath
do_install cpio
do_install openssh-server
do_install samba
do_install subversion
do_install git
do_install git-core
do_install libgl1-mesa-dev
do_install libglu1-mesa-dev
#do_install asciidoc
pdone "Instal tools [FINISH]"
