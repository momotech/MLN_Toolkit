#!/bin/bash
# Author tamer
PSW=$1
if [[ ! -n "${PSW}" ]]; then
	echo "请开机密码锁 _>:"
    read PSW
fi
############### 配置apache ################
echo ${PSW} | sudo -S chmod +x servers.sh
echo ${PSW} | sudo -S chmod +x luac.sh
echo ${PSW} | sudo -S chmod +x deploy.sh
echo ${PSW} | sudo -S chmod +x luac.sh
echo ${PSW} | sudo -S chmod +x mobdebug.h
./servers.sh ${PSW}
./luac.sh
echo ${PSW} | sudo chmod 777 ${HOME}/Sites
echo ${PSW} | sudo chmod 777 ${HOME}/Sites/index.html

echo ${PSW} | sudo chmod +x setup2.sh
./setup2.sh
