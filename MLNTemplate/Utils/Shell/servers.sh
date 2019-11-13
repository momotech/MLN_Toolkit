#!/bin/bash
# Auther tamer
# 获取密码配置
#CURRENT_DIR=$PWD
#pwd_file=sudo cat ${CURRENT_DIR}/pwd.conf
#pwd_str=$pwd_file|egrep -i aa
pwd_str=$1
# 判断当前是不是root用户，不要用root用户执行
if [  $USER = root  ];then
echo "Error: Please rerun this script as user ."
exit 1
fi
USER_NAME=$USER

############################ 主目录下新建Sites ############################
echo ">: create directory  ${HOME}/Sites"
if [ ! -d ${HOME}/Sites ]; then
sudo mkdir ${HOME}/Sites <<EOF
$pwd_str
EOF
fi
echo ">: create ${HOME}/Sites/index.html"
cd ${HOME}/Sites
touch index.html
echo "<html>" | sudo tee index.html
echo "  <title>" | sudo tee -a index.html
echo "    MMILua" | sudo tee -a index.html
echo "  </title>" | sudo tee -a index.html
echo "  <body>" | sudo tee -a index.html
echo "    That'a all right!</br> you are so clever,baby!" | sudo tee -a index.html
echo "  </body>" | sudo tee -a index.html
echo "</html>" | sudo tee -a index.html

################################ 创建username.conf文件 ################################
echo ">: create /etc/apache2/users/${USER_NAME}.conf"
cd /etc/apache2/users
sudo touch ${USER_NAME}.conf
echo "#Auther tamer" |sudo tee ${USER_NAME}.conf
echo "<Directory \"/Users/${USER_NAME}/Sites/\">" |sudo tee -a ${USER_NAME}.conf
echo "Options Indexes MultiViews FollowSymLinks" |sudo tee -a ${USER_NAME}.conf
echo "AllowOverride All" |sudo tee -a ${USER_NAME}.conf
echo "Order allow,deny" |sudo tee -a ${USER_NAME}.conf
echo "Allow from all" |sudo tee -a ${USER_NAME}.conf
echo "Require all granted" |sudo tee -a ${USER_NAME}.conf
echo "</Directory>" |sudo tee -a ${USER_NAME}.conf
sudo chmod 775 ${USER_NAME}.conf

################################# 配置apche服务器 ################################
cd /etc/apache2/
########### 1. 备份httpd.conf ###########
echo ">: backup for /etc/apache2/httpd.conf"
echo $pwd_str | sudo -S cp httpd.conf httpd.conf.backup
########### 2. 配置httpd.conf ###########
echo ">: resetting for httpd.conf"
#72 idx
echo $pwd_str | sudo -S sed -i "" 's/ *\# *\(LoadModule *authz_host_module *libexec\/apache2\/mod_authz_host.so\)/\1/g' httpd.conf
#78 idx
echo $pwd_str | sudo -S sed -i "" 's/ *\# *\(LoadModule *authz_core_module *libexec\/apache2\/mod_authz_core.so\)/\1/g' httpd.conf
## 166 idx
echo $pwd_str | sudo -S sed -i "" 's/ *\# *\(LoadModule *userdir_module *libexec\/apache2\/mod_userdir.so\)/\1/g' httpd.conf
#169 idx
echo $pwd_str | sudo -S sed -i "" 's/ *\# *\(LoadModule *php5_module *libexec\/apache2\/libphp5.so\)/\1/g' httpd.conf
#181行
echo $pwd_str | sudo -S sed -i "" "s/\(^User *\)[^ ]*\( *\)$/\1${USER_NAME}\2/g" httpd.conf
echo $pwd_str | sudo -S sed -i "" "s/\(^Group *\)[^ ]*\( *\)$/\1wheel\2/g" httpd.conf
#220行
echo $pwd_str | sudo -S sed -i "" '/<Directory \/>/,/<\/Directory>/s/\(.*\)AllowOverride *none\(.*\)/\1AllowOverride all\2/g' httpd.conf
echo $pwd_str | sudo -S sed -i "" '/<Directory \/>/,/<\/Directory>/s/\(.*\)Require *all *denied\(.*\)/\1Require all granted\2/g' httpd.conf
# 503 idx
echo $pwd_str | sudo -S sed -i "" 's/ *\# *\(Include *\/private\/etc\/apache2\/extra\/httpd-userdir.conf\)/\1/g' httpd.conf
########### 3. 配置httpd-userdir.conf ###########
echo ">: resetting for /etc/apache2/extra/httpd-userdir.conf"
cd /etc/apache2/extra/
#16 idx
echo $pwd_str | sudo -S sed -i "" 's/ *\# *\(Include \/private\/etc\/apache2\/users\/*.conf\)/\1/g' httpd-userdir.conf
########### 4. 配置虚拟主机 ###########
echo ">: resetting for V-Host at /etc/apache2/httpd.conf"
cd /etc/apache2/
# 509 idx
echo $pwd_str | sudo -S sed -i "" 's/ *\# *\(Include *\/private\/etc\/apache2\/extra\/httpd-vhosts.conf\)/\1/g' httpd.conf
# 追加
if cat /etc/apache2/httpd.conf | grep " *<VirtualHost *\*\:80>">/dev/null
then
echo "YES"
else
echo "<VirtualHost *:80>" |sudo tee -a httpd.conf
fi

if cat /etc/apache2/httpd.conf | grep " *ServerName *mmilua\.com">/dev/null
then
echo "YES"
else
echo "  ServerName mmilua.com" |sudo tee -a httpd.conf
fi

if cat /etc/apache2/httpd.conf | grep " *DocumentRoot *\"${HOME}\/Sites\/\"">/dev/null
then
echo "YES"
else
echo "  DocumentRoot \"${HOME}/Sites/\"" |sudo tee -a httpd.conf
fi

if cat /etc/apache2/httpd.conf | grep " *<\/VirtualHost>">/dev/null
then
echo "YES"
else
echo "</VirtualHost>" |sudo tee -a httpd.conf
fi

################################# 配置DNS ################################
echo ">: resetting for DNS Map"
if cat /etc/hosts | grep "127\.0\.0\.1 *mmilua\.com">/dev/null
then
echo "YES"
else
echo "127.0.0.1 mmilua.com" |sudo tee -a /etc/hosts
fi

################################# 重启Apache ################################
echo $pwd_str | sudo -S apachectl restart
echo ">: all finish!"
