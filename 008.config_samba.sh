#!/bin/bash
#作者:DUGIGEEK
#日期:2018.12.08
#描述:samba配置

#使用颜色打印函数
source ~/.colorc

#设定用户
smb_user_name=$(whoami)
#设定需要修改的文件
smb_root_path=/etc/samba/smb.conf

#拷贝配置文件样本
sudo cp sambafiles/smb.conf $smb_root_path
pdone "Copy sambafiles/smb.conf $smb_root_path [OK]"

#修改配置文件中当前用户
sudo sed -i "s#\[dugigeek\]#\[${smb_user_name}\]#g"                     $smb_root_path
sudo sed -i "s#path=/home/dugigeek#path=/home/${smb_user_name}#g"       $smb_root_path
sudo sed -i "s#valid users = dugigeek#valid users = ${smb_user_name}#g" $smb_root_path
sudo smbpasswd -a $(whoami)
pdone "Setup samba [OK]"
