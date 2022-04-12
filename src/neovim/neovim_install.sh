#!/bin/bash
function neovimInstall(){
echo -e "\034[1;5;34m==========开始安装neovim=========\033[0m"
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install -y neovim python3-neovim
echo -e "\034[1;5;32m=========安装完成=========\033[0m"
pip install pynvim
pip4 install pynvim
npm install -g neovim 
python3 -m pip install neovim
}
neovimInstall
