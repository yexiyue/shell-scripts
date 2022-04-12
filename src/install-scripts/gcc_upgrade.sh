#!/bin/bash
function gccUpgrade(){
#安装高版本gcc
echo -e "\033[1;5;34m==========安装高版本gcc==========\033[0m"
#安装gcc镜像源
yum install centos-release-scl -y
#安装gcc9
yum install devtoolset-11 -y
echo -e "\033[1;5;32m安装后在目录 /opt/rh/devtoolset-11\033[0m"
scl -l
scl enable devtoolset-11 bash
}
gccUpgrade
