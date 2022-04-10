#! /bin/bash
#导入静态IP配置模块
. ./src/config-scripts/static_ip_cfg.sh
# staticIpCfg

#导入更换yum源模块
. ./src/config-scripts/change_yum_source.sh
# changeYumSource

#导入常用包安装模块
. ./src/install-scripts/install_commonly_page.sh
# installCommonlyPage

#导入更新时间模块
. ./src/config-scripts/update_date.sh
# updateDate

#导入更改软件安装限制
. ./src/config-scripts/disable_selinux.sh
# disableSelinux

#导入node安装模块
. ./src/install-scripts/node_install.sh
# nodeInstall

#导入nginx安装模块
. ./src/install-scripts/nginx_install.sh
# nginxInstall

#导入git安装模块
. ./src/install-scripts/git_install.sh
# gitInstall

#导入git配置模块
. ./src/config-scripts/git_config.sh
#girConfig

