#!/bin/bash
function neovimInstall(){
echo -e "\033[1;5;34m==========开始安装neovim=========\033[0m"
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install -y neovim python3-neovim
echo -e "\033[1;5;32m=========安装完成=========\033[0m"
pip install pynvim
pip3 install pynvim
}
neovimInstall
