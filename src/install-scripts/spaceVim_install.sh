#!/bin/bash
function spaceVimInstall(){
echo -e "\033[1;5;34m请提前安装好neovim和python3\033[0m"
echo -e "\033[1;5;34m===========spaceVimInstall==========\033[0m"
#下载
curl -sLf https://spacevim.org/cn/install.sh | bash


}
spaceVimInstall
