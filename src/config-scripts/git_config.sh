function gitConfig(){
echo -e "\033[1;5;34m=========开始配置git==========\033[0m"
echo -e "\033[1;35m请输入用户名\033[0m"
read name
git config --global user.name=$name

echo -e "\033[1;35m请输入邮箱\033[0m"
read email
git config --global user.email=$email

echo -e "\033[1;35m其他默认配置如避免乱码\033[0m"
git config --global core.autocrlf false
git config --global core.quotepath off
git config --global gui.encoding utf-8

echo -e "\033[1;5;32m==========配置完成=========\033[0m"
git config --list

echo -e "\033[1;5;34m是否要生成ssh keys可能会覆盖之前的请谨慎操作\033[0m"
select check in "是" "否"
do
  case $check in
     "否")
	exit
	break;;
     "是")
	mkdir -p ~/.ssh/`git config --global user.name`
	ssh-keygen -t rsa -C `git config --global user.email` -f ~/.ssh/`git config --global user.name`/ssh_rsa
	ssh -v git@github.com
	ssh-agent -s
	break ;;
  esac
done
echo -e "\033[1;5;32m密钥生成成功请复制到github上或者在~/.ssh/`git config --global user.name`/ssh_rsa.pub下复制\033[0m"
cat ~/.ssh/`git config --global user.name`/ssh_rsa.pub
echo -e "\033[1;35m复制完成请输入yes\033[0m"
read istrue
if [[ $istrue -eq "yes" ]]
then
   ssh-add ~/.ssh/`git config --global user.name`/ssh_rsa
   ssh -T git@github.com
   echo -e "\033[1;5;32m如果最后输出的内容出现successly则成功\033[0m"
else
echo -e "\033[1;5;31m配置失败"
fi
}

