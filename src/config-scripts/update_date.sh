#! /bin/bash
function updateDate(){
#更新时间
echo -e "\033[1;5;34m=========开始更新时间========\033[0m"
if [[ `yum info ntp` ]]
then
ntpdate cn.ntp.org.cn
else
yum install -y ntp
ntpdate cn.ntp.org.cn
fi
date
echo -e "\033[1;3;4;34m==========添加定时任务自动更新时间=========\033[0m"
touch myconf && echo "30 9 * * * ntpdate cn.ntp.org.cn" >> myconf
crontab myconf
rm -rf myconf
crontab -l

echo -e "\033[1;5;32m=========更新时间及添加定时任务完成==========\033[0m"
}
