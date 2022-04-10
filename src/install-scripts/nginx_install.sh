#!/bin/bash
function nginxInstall(){
echo -e "\033[1;5;34m==========开始安装nginx==========\033[0m"
echo -e "\033[1;35m请输入下载链接\033[0m"
read weblink
wget -O ~/nginx.tar.gz $weblink
mkdir ~/nginx
tar -xvf ~/nginx.tar.gz -C ~/nginx --strip-components 1
#安装依赖
yum install gcc pcre pcre-devel zlib zlib-devel -y
cd ~/nginx
./configure --prefix=/usr/local/nginx
make install
ln -s /usr/local/nginx/sbin/nginx /usr/bin/
nginx -v
if [[ -e /usr/lib/systemd/system/nginx.service  ]]
then
echo -e "\033[1;4;32mnginx服务已经存在\033[0m"
else
echo -e "\033[1;35m写入nginx服务到/usr/lib/systemd/system/nginx.service\033[0m"
echo '[Unit]
Description=nginx - web server
After=network.target remote-fs.target nss-lookup.target

[Service]
Type=forking
PIDFile=/usr/local/nginx/logs/nginx.pid
ExecStartPre=/usr/local/nginx/sbin/nginx -t -c /usr/local/nginx/conf/nginx.conf
ExecStart=/usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf
ExecReload=/usr/local/nginx/sbin/nginx -s reload
ExecStop=/usr/local/nginx/sbin/nginx -s stop
ExecQuit=/usr/local/nginx/sbin/nginx -s quit
PrivateTmp=true

[Install]
WantedBy=multi-user.target' > /usr/lib/systemd/system/nginx.service
#重新加载守护进程
systemctl daemon-reload
#启动nginx
systemctl start nginx
#加入到开机自启服务
systemctl enable nginx
fi
#查看nginx状态
systemctl status nginx
echo -e "\033[1;5;32m==========nginx安装完成==========\033[0m"
rm -rf ~/nginx
}

