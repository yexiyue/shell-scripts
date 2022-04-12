#!/bin/bash
echo -e "\033[1;5;34m=========开始安装spacevim一系列==========\033[0m"
#导入python安装模块
sh ../install-scripts/python_install.sh
#导入neovim安装模块
. ./neovim_install.sh
#导入spaceVim安装模块
. ./spaceVim_install.sh
