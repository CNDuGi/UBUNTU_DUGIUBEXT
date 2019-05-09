#!/bin/bash
#作者:DUGIGEEK
#日期:2018.12.08
#描述:git的配置

#使用颜色打印函数
source ~/.colorc

#设置当前用户的git名称和邮箱
user_name=$(whoami)
user_mail=2362317758@qq.com

#安装git工具
sudo apt-get install git  > /dev/null 2>&1
if [ $? -ne 0 ]; then
	perro "Install git [ERROR]"
	exit 1
fi
pdone "Install git [OK]"

#拷贝一些脚本作为日常git管理使用
sudo cp gitfiles/dugi.*.sh /usr/bin/
sudo chmod 777 /usr/bin/dugi.*.sh
pdone "Config git [OK]"

#写入用户信息
git config --global user.name "${user_name}"
pdone "Setup git user name: ${user_name} [OK]"
git config --global user.email "${user_mail}"
pdone "Setup git user email: ${user_mail} [OK]"
