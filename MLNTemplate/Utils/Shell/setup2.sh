#!/bin/bash
#复制脚本到bin目录

if [[ ! -d ~/bin ]]; then
	mkdir -p ~/bin
fi
if [[ -d ~/bin/shell ]]; then
	rm -rf ~/bin/shell
fi

cp -aRf ../shell ~/bin/shell

d="#!/bin/bash\n
cd ~/bin/shell\n

./deploy.sh \$1 \$2 \$3 \$4 \$5 \$6\n
./openDebug.sh"

# 创建deploy命令
echo -e ${d} > ~/bin/deploy
chmod +x ~/bin/deploy

cp ~/bin/shell/openDebug.sh ~/bin/openDebug
cp ~/bin/shell/index ~/bin/index
cp ~/bin/shell/mobdebug.sh ~/bin/mobdebug
chmod +x ~/bin/mobdebug

# 把~/bin 加入环境中
cd ~
u=`pwd`/bin
rep=${u//\//\\\/}

sed -i '' "s/export PATH=${rep}:\$PATH//g" .bash_profile
echo "export PATH=${u}:\$PATH" | cat >> .bash_profile

sed '/^$/d' .bash_profile > .bash_profile_temp
mv .bash_profile_temp .bash_profile