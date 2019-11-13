#!/bin/bash
OPTION='<option value=\"name\">name<\/option>'
parentDir=`dirname $0`
allLuaFile=()
for file in $(ls ~/Sites/*); do
	if [[ -f ${file} ]]; then
		file=${file##/*/}
		suffix=${file#*.}
		if [ -n "${suffix}" -a "${suffix}" != "html" ]; then
			allLuaFile[${#allLuaFile[@]}]=${file}
		fi
	fi
done

options=''
echo '------------------------------------------------'
echo 'all lua file:'
for f in "${allLuaFile[@]}"; do
	echo $f
	options=${options}${OPTION//name/${f}}
done
echo '------------------------------------------------'
ip=`ifconfig | grep 'inet 172'`
ip=${ip#*inet }
ip=${ip%% netmask*}
if [ ! -n "${ip}" ]; then
	echo "获取ip失败"
	exit 1
fi
echo "local ip: ${ip}"

echo '------------------------------------------------'
echo 'user: '$USER
echo '------------------------------------------------'

cp ${parentDir}/index ~/Sites/index.html
sed -i '' "s/addhere/${options}/g" ~/Sites/index.html
sed -i '' "s/\(var ip.*\)\".*\"/\1\"${ip}\"/g" ~/Sites/index.html
sed -i '' "s/\(var user.*\)\".*\"/\1\"${USER}\"/g" ~/Sites/index.html

open ~/Sites/index.html