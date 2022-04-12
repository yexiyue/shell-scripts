#!/bin/bash
function pythonInstall(){
echo -e "\033[1;5;34m=========开始编译安装python==========\033[0m"
#下载安装包
wget -O ~/python.tar.gz https://www.python.org/ftp/python/3.8.12/Python-3.8.12.tar.xz
#解压
mkdir ~/python
tar -xvf ~/python.tar.gz -C ~/python --strip-components 1
rm -rf ~/python.tar.gz
cd ~/python
#编译
./configure --prefix=/usr/local/python
#编译到预设文件夹
make
#安装
make install
#配置环境变量
echo 'export PYTHON_HOME=/usr/local/python/bin' >> /etc/profile
echo 'export PATH=$PYTHON_HOME:$PATH' >> /etc/profile
source /etc/profile
python3 --version
#升级一下pip 和setuptools
python3 -m pip install -U pip setuptools
}
pythonInstall
