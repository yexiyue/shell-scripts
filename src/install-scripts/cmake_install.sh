#!/bin/bash
function cmakeInstall(){
echo -e "\033[1;5;34m==========开始安装cmake==========\033[0m"
#下载
wget -O ~/cmake.tar.gz https://github.com/Kitware/CMake/releases/download/v3.23.0/cmake-3.23.0.tar.gz
mkdir ~/cmake
tar -xvf ~/cmake.tar.gz -C ~/cmake --strip-components 1
cd ~/cmake
./bootstrap --prefix=/usr/local/cmake
make prefix=/usr/local/cmake
make install
rm -rf ~/cmake.tar.gz
echo 'export CMAKE_HOME=/usr/local/cmake/bin' >> /etc/profile
echo 'export PATH=$CMAKE_HOME:$PATH' >> /etc/profile
cmake --version
}
cmakeInstall
