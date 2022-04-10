#! /bin/bash
function staticIpCfg(){
echo -e "\033[1;5;34m===========开始配置静态IP==========\033[0m"
echo -e "\033[1;35m配置文件路径/etc/sysconfig/network-scripts/ifcfg-ens33 配置ens33号网卡\033[0m"
if [[ -e /etc/sysconfig/network-scripts/ifcfg-ens33  ]]
then

  #定义网络信息相关变量
export  ipaddr="192.168.188.100"
export  netmask="255.255.255.0"
export  gateway="192.168.188.2"
export  DNS1="114.114.114.114"
export  DNS2="8.8.8.8"
  #先把公共部分输出到文件中
  echo "TYPE=Ethernet
PROXY_METHOD=none
BROWSER_ONLY=no
BOOTPROTO=static
DEFROUTE=yes
IPV4_FAILURE_FATAL=no
IPV6INIT=yes
IPV6_AUTOCONF=yes
IPV6_DEFROUTE=yes
IPV6_FAILURE_FATAL=no
IPV6_ADDR_GEN_MODE=stable-privacy
NAME=ens33
DEVICE=ens33
ONBOOT=yes
" 1> /etc/sysconfig/network-scripts/ifcfg-ens33
  
  #设置选项
echo -e "\033[35m请输入静态ip地址192(192.168.188.100 默认)\033[0m"
select mode in "默认" "手动输入"
do
	case $mode in
		"默认")break;;
		"手动输入")read  ipaddr
		break;;
	esac	
done

echo -e "\033[35m请输入子网掩码(255.255.255.0 默认) \033[0m" 
select mode in "默认" "手动输入"
do      
        case $mode in 
                "默认")break;;
                "手动输入")read  netmask
                break;;
        esac 
done

echo -e "\033[35m请输入网关(192.168.188.2 默认)\033[0m"
select mode in "默认" "手动输入"
do
        case $mode in
                "默认")break;;
                "手动输入")read  gateway
                break;;
        esac
done

echo -e "\033[35m请输入域名解析服务地址(114.114.114.114 默认)\033[0m"
select mode in "默认" "手动输入"
do
        case $mode in
                "默认")break;;
                "手动输入")read  DNS1
                break;;
        esac
done

echo -e "\033[35m请输入域名解析服务地址(8.8.8.8 默认)\033[0m"
select mode in "默认" "手动输入"
do
        case $mode in
                "默认")break;;
                "手动输入")read  DNS2
                break;;
        esac
done





wait
echo "IPADDR=$ipaddr
NETMASK=$netmask
GATEWAY=$gateway
DNS1=$DNS1
DNS2=$DNS2" >> /etc/sysconfig/network-scripts/ifcfg-ens33

else
echo -e "\033[1;31m配置文件不存在 \033[0m"
fi

systemctl status network
systemctl restart network

echo -e "\033[1;5;32m===========静态IP配置完成==========\033[0m"

}
