#!/bin/bash
function neovimInstall(){
echo -e "\033[1;5;34m==========开始安装neovim=========\033[0m"
wget -O ~/neovim.tar.gz https://github.com/neovim/neovim/releases/download/v0.6.1/nvim-linux64.tar.gz
mkdir -p /usr/local/neovim
tar -xvf ~/neovim.tar.gz -C /usr/local/neovim --strip-components 1
ln -s /usr/local/neovim/bin/nvim /bin/nvim
echo -e "\033[1;5;32m=========安装完成=========\033[0m"
pip install pynvim
pip3 install pynvim
npm install -g neovim 
python3 -m pip install neovim
}
neovimInstall
