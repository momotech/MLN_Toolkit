#!/bin/bash
# Author tamer

LastPath=${PWD}

cd ${HOME}
echo "|| 请输入开发环境： 1 iOS  2 android"
read DEV_EN
if [[ DEV_EN -eq 1 ]]; then
# iOS用5.1.4
luaVersion=5.1.4
else
# android用5.2.4
luaVersion=5.2.4
fi
luaPackage=lua-${luaVersion}

echo "||Downloading: http://www.lua.org/ftp/${luaPackage}.tar.gz"
sudo curl -R -O http://www.lua.org/ftp/${luaPackage}.tar.gz <<EOF
$1
EOF
echo "||Download: completed!"

echo "||Setup: luac util ..."
sudo tar zxf ${luaPackage}.tar.gz <<EOF
$1
EOF

cd ${luaPackage}
sudo make macosx test <<EOF
$1
EOF
sudo make install <<EOF
$1
EOF
echo "||Setup: completed!"

cd $LastPath
