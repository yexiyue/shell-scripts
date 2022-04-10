#! /bin/bash
function changeYumSource(){
echo -e "\033[1;5;34m==========开始更换yum源=========\033[0m"
#安装wget
yum install wget -y
#使原来的配置文件失效
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
#下载阿里的配置文件
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
yum clean all
yum makecache
}
