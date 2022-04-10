#!/bin/bash
function nodeInstall(){
#开始安装node
echo -e "\033[1;5;34m=========开始安装node==========\033[0m"
function testIns(){
yum info wget
}
testIns
if [[ $? -ne 0 ]]
then
echo -e "\033[1;5;31m没有wget模块，开始安装\033[0m"
yum install wget -y
fi

echo -e "\033[1;35m请输入node安装包网址\033[0m"
read addr
echo $addr > download.txt
wget -O ~/node.tar.xz  -i download.txt
rm -rf download.txt
mkdir /usr/local/node
tar -xvf ~/node.tar.xz -C /usr/local/node --strip-components 1
echo -e "\033[1;32m配置环境变量\033[0m"
echo 'export NODE_HOME=/usr/local/node' >>/etc/profile
echo 'export PATH=$NODE_HOME/bin:$PATH' >> /etc/profile
source /etc/profile
wait
echo -e "\033[1;5;32m=========安装成功==========\033[0m"
node -v
rm -rf ~/node.tar.xz

}
