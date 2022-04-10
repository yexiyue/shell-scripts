# ease-shell脚本库



## 1.创作背景

近日吾学习了linux，感觉是个不错的体验，但在安装软件如mysql等不是很方便，没有Windows那样的傻瓜式安装，故写下这些脚本。



## 2.不定时更新

吾会在学习的过程中把一些常见的操作写成脚本，提高可复用性，人类最大的特点就是会创造和使用工具。忙活了几天，起早摸黑写了这些shell 脚本，希望大家喜欢，可以的话点个star吧。

<img src="https://s2.loli.net/2022/04/10/HGZ7gvUJ12MrsEC.jpg" style="zoom:150%;" />



## 3.下面是我linux学习笔记

[linux学习笔记 - 掘金 (juejin.cn)](https://juejin.cn/post/7084768750758527007/)



## 4.脚本使用说明

![image-20220410130956349](https://s2.loli.net/2022/04/10/X2JTOjELox9DBtz.png)

src下面存放的两个目录是脚本文件所在位置

**config-scripts目录**

```sh
#./src/config-scripts/
change_yum_source.sh #更换yum源脚本
disable_selinux.sh #更改默认安装限制脚本
git_config.sh #git常用配置如ssh配置
static_ip_cfg.sh #主要是提供给本地虚拟机配置静态IP
update_date.sh #时间更新脚本
```

**install-scripts目录**

```sh
#./src/install-scripts/
git_install.sh #编译安装git脚本
install_commonly_page.sh #安装一些常用的包
nginx_install.sh #nginx安装脚本
node_install.sh #node安装脚本
```

### **注意：**

**以上的文件里面我写的都是函数**

**直接运行单个文件没有效果**



### **注意：**

**可能刚下载的文件上传到linux上格式会不对**

**这时需要vim每个脚本文件**

**:set fileformat=unix**

这样就能执行了



### **注意：**

**在使用配置模块时要单独使用**

**先输入**

**ssh-agent  bash**

**再**

**sh init.sh**

### init.sh入口文件

```sh
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
```



### 如何使用

1. **把文件下载到linux上面**
2. **修改init.sh**
3. **选择你想要的如何解开注释**
4. **cd shell-scripts**
5. **sh init.sh**



### 使用截图

![image-20220410132425866](https://s2.loli.net/2022/04/10/fXZypVuYwskdqG8.png)



安装的时候要求输入链接

![image-20220410132339225](https://s2.loli.net/2022/04/10/qem6lY8LdPKigf5.png)



找到二进制文件右键复制链接

如何把链接输入进终端就行了

![image-20220410132605335](https://s2.loli.net/2022/04/10/EqbtwuDPh6ozCNT.png)



并且会自动配置环境变量

![image-20220410132639213](https://s2.loli.net/2022/04/10/5Qp1TU9NJfDlaoK.png)



### 5.说明

关于mysql及其他相关的脚本，吾正在努力编写中

