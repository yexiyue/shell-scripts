function gitInstall(){
#安装git
echo -e "\033[1;5;34m==========开始安装git==========\033[0m"
echo -e "\033[1;35m请输入git链接地址(输入abc表示默认使用默认的版本安装)\033[0m"
read gitaddr
if [[ $gitadd -eq "abc" ]]
then 
gitaddr='https://github.com/git/git/archive/refs/tags/v2.34.1.tar.gz'
fi
wget -O ~/git.tar.gz $gitaddr
mkdir ~/git
tar -xvf ~/git.tar.gz -C ~/git --strip-components 1
#安装依赖
yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel gcc perl-ExtUtils-MakeMaker -y
#编译
cd ~/git
make prefix=/usr/local/git all
#安装
make prefix=/usr/local/git install
#配置环境变量
echo 'export GIT_HOME=/usr/local/git/bin' >>/etc/profile
echo 'export PATH=$GIT_HOME:$PATH' >> /etc/profile
#重新加载资源
source /etc/profile
echo -e "\033[1;5;32m==========git安装成功==========\033[0m"
git --version
rm -rf ~/git.tar.gz ~/git
}

