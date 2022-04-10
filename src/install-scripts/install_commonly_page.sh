#! /bin/bash
function installCommonlyPage(){
#安装常用包
echo -e "\033[1;5;34m==========安装常用包==========\033[0m"
yum install net-tools -y
yum install ntp -y
yum install lrzsz -y
yum install telnet -y
yum install zip unzip -y
echo -e "\033[1;5;32m=========常用包安装完成=========\033[0m"
}
