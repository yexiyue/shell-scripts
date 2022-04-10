#! /bin/bash
function disableSelinux(){
#把软件安装安全模式调整到最低
echo -e "\033[1;5;34m=========更改安装限制=========\033[0m"
echo -e "\033[1;35m配置文件路径：/etc/selinux/config\033[0m"
echo "# This file controls the state of SELinux on the system.
# SELINUX= can take one of these three values:
#     enforcing - SELinux security policy is enforced.
#     permissive - SELinux prints warnings instead of enforcing.
#     disabled - No SELinux policy is loaded.
SELINUX=disabled
# SELINUXTYPE= can take one of three values:
#     targeted - Targeted processes are protected,
#     minimum - Modification of targeted policy. Only selected processes are protected. 
#     mls - Multi Level Security protection.
SELINUXTYPE=targeted" > /etc/selinux/config
cat /etc/selinux/config
echo -e "\033[1;5;32m=========更改安装限制完成=========\033[0m"
}
