#!/bin/bash
# Author tamer

#/Users/tamer/workspace/MomoLua/MomoLua/src 920520 /Users/tamer/workspace/MomoLua/MomoLua 1 NearbyLive NearbyLive
# 获取参数
echo "deploy.sh <src_dir> <password> <project_dir> [1|2|3] [sub_src]"
Src_Dir=$1
UPWD=$2
Project_Dir=$3
LPackageType=$4
Sub_Path=$5
Zip_Name=$6

Shell_Dir=${PWD}
if [ ! -n "${Project_Dir}" ]; then
Project_Dir=Src_Dir
fi
# 配置路径
Deploy_Dir=${Project_Dir}/Deploy
# 不处理路径
UI_Dir=${Src_Dir}/UI
Util_Dir=${Src_Dir}/Util
Demo_Dir=${Src_Dir}/Demo
Backup_Dir=${Src_Dir}/backup
MomoKit_Dir=${Src_Dir}/MomoKit
Preprocess_Dir=${Src_Dir}/Preprocess_Dir
Preprocess_Dir_New=${Project_Dir}/Preprocess_Dir
Precompile_Dir=${Project_Dir}/Precompile
echo "||Tip：当前工程下的目录有 _>:"
echo "—————————————————————————————————————————————————————————————————"
cd $Src_Dir
# 目录树
find . -type d -print 2>/dev/null|awk '!/\.$/ {for (i=1;i<NF;i++){d=length($i);if ( d < 5 && i != 1 )d=5;printf("%"d"s","|")}print "---"$NF}' FS='/'
echo "—————————————————————————————————————————————————————————————————"
if [[ ! -n "${Sub_Path}" ]]; then
    echo "请输入要打包的文件路径（相对于src）_>:"
    read Sub_Path
fi

# 要打包的路径
DST_Dir=$Src_Dir
if [ -n "${Sub_Path}" ]; then
DST_Dir="${DST_Dir}/${Sub_Path}"
fi
if [ ! -d $DST_Dir ]; then
echo "||Error:路径不存在 ${DST_Dir}"
exit 0
fi
echo "要打包的文件路径为: ${DST_Dir}"

if [[ LPackageType -eq 1 ]]; then
    if [[ ! -n "${Zip_Name}" ]]; then
        Zip_Name=${Sub_Path}
    fi
    AutomaticDependence=y
elif [[ LPackageType -eq 3 ]]; then
    if [[ ! -n "${Zip_Name}" ]]; then
        Zip_Name=${Sub_Path}
    fi
    AutomaticDependence=y
fi

if [[ ! -n "${Zip_Name}" ]]; then
    echo "请输入打包后的zip文件名字 _>:"
    read Zip_Name
fi

if [ ! -n "${Zip_Name}" ]; then
Zip_Name="mmlua"
fi
zipFileName="${Zip_Name}.zip"
echo "打包后的zip文件名字为: ${zipFileName}"

if [[ ! -n "${AutomaticDependence}" ]]; then
    echo "是否自动处理外部依赖：y（处理）n（不处理），提示：如果不处理外部依赖，文件可能不能单独运行在客户端中。 _>:"
    read AutomaticDependence
fi

if [ ! -n "${AutomaticDependence}" ]; then
AutomaticDependence=n
fi
echo "自动处理外部依赖: ${AutomaticDependence}"

if [[ ! -n "${LPackageType}" ]]; then
    echo "请输入类型：1 deubg 2 inhouse 3 distribution _>:"
    read LPackageType
fi

if [ ! -n "${LPackageType}" ]; then
LPackageType=1
fi

case $LPackageType in
2)
echo "当前包类型为：inhouse"
;;
3)
echo "当前包类型为：distribution"
;;
*)
echo "当前包类型为：debug"
;;
esac

if [ -d $Deploy_Dir ]; then
rm -rf $Deploy_Dir
echo "clear ${Deploy_Dir},..."
fi
echo "Create release directory Successfully!"
mkdir $Deploy_Dir

# 备份
echo "||Backup: backup starting..."
for file_a in ${DST_Dir}/*; do
if [ -d $file_a ]; then
if [ "$file_a" == "$Deploy_Dir" ]; then
echo "||Break: $Deploy_Dir"
continue
elif [ "$file_a" == "$UI_Dir" ]; then
echo "||Break: $UI_Dir "
continue
elif [ "$file_a" == "$Util_Dir" ]; then
echo "||Break: $Util_Dir"
continue
elif [ "$file_a" == "$Demo_Dir" ]; then
echo "||Break: $Demo_Dir"
continue
elif [ "$file_a" == "$Backup_Dir" ]; then
echo "||Break: $Backup_Dir"
continue
elif [ "$file_a" == "$MomoKit_Dir" ]; then
echo "||Break: $MomoKit_Dir"
continue
elif [ "$file_a" == "$Preprocess_Dir" ]; then
echo "||Break: $Preprocess_Dir"
continue
elif [ "$file_a" == "$Preprocess_Dir_New" ]; then
echo "||Break: $Preprocess_Dir_New"
continue
elif [ "$file_a" == "$Precompile_Dir" ]; then
echo "||Break: $Precompile_Dir"
continue
fi
fi
cp -R $file_a $Deploy_Dir
echo "||Backup: 【${file_a}]】 completed."
done

# 删除注释和空白行
deleteComment(){
sed -i "" '/^ *--.*$/d' $1
sed -i "" '/^ *$/d' $1
}

# 删除MomoKit引用 @note 最初版本遗留问题
deleteRequireMomoKit(){
sed -i "" '/^ *require *(.*" *MomoKit\.[^ ]* *" *) *$/d' $1
}

# 删除---结尾的行 @note 最初版本遗留问题
deleteEnding3(){
sed -i "" '/^.*---$/d' $1
}

# 替换--结尾的行  @note 最初版本遗留问题
replaceEnding2(){
# local
sed -i "" 's/^\( *\)-- *\(local\) *\([^ ]*\) *= *require *(.*" *UI\.\([^ ]*\) *" *) *--$/\1\2 \3= \4()/g' $1
sed -i "" 's/^\( *\)-- *\(local\) *\([^ ]*\) *= *require(.*" *Util\.\([^ ]*\) *" *) *--$/\1\2 \3= \4()/g' $1
sed -i "" 's/^\( *\)\(local\) *\([^ ]*\) *= *require(.*" *Util\.\([^ ]*\) *" *) *--$/\1\2 \3= \4()/g' $1
sed -i "" 's/^\( *\)\(local\) *\([^ ]*\) *= *require(.*" *UI\.\([^ ]*\) *" *) *--$/\1\2 \3= \4()/g' $1
# globle
sed -i "" 's/^\( *\)-- *\([^ ]*\) *= *require *(.*" *UI\.\([^ ]*\) *" *) *--$/\1\2 = \3()/g' $1
sed -i "" 's/^\( *\)-- *\([^ ]*\) *= *require(.*" *Util\.\([^ ]*\) *" *) *--$/\1\2 = \3()/g' $1
sed -i "" 's/^\( *\)\([^ ]*\) *= *require(.*" *Util\.\([^ ]*\) *" *) *--$/\1\2 = \3()/g' $1
sed -i "" 's/^\( *\)\([^ ]*\) *= *require(.*" *UI\.\([^ ]*\) *" *) *--$/\1\2 = \3()/g' $1
}

doRequire(){
local current_file_path=$1
echo "||Process: require for [${current_file_path}] ..."
# 判断是不是文件
if [ -f $current_file_path ]; then
#获取require行中内容
local all_require=`grep '^[^-]*require *( *"[^"]*" *)[^-]*$' $current_file_path | cut -d '"' -f 2`
for a_req in $all_require;do
local current_deploy_dir=$Deploy_Dir
local current_require=$a_req
# 是或否包含.
if [[ "${all_require}" =~ "." ]]; then
#替换.为/
current_require=${a_req//\./\/} # 一个“/”表示替换第一个，”//”表示替换所有
# 查看要部署的路径是否存在
local deploy_path="${Deploy_Dir}/${current_require%/*}" # 去掉从右边算起的第一个'/'字符及其右边的内容
if [ ! -d $deploy_path ]; then
echo "||make dir: $deploy_path"
mkdir -p $deploy_path
fi
else
current_deploy_dir=${current_file_path%/*} # 去掉从右边算起的第一个'/'字符及其右边的内容
fi
#添加后缀.lua
local orig_file_path="${Src_Dir}/${current_require}.lua"
local deploy_file_path="${current_deploy_dir}/${current_require}.lua"
echo "||require: [$current_file_path] require [ $orig_file_path ]"
# 复制文件到deploy目录
if [ ! -f $deploy_file_path ]; then
#  目标文件不存在
if [ ! -f $orig_file_path ]; then
echo "||Warning: require file [${orig_file_path}] was not found! __Function:doRequire()__"
continue
fi
echo "||Backup: [${orig_file_path}] to [${deploy_file_path}] "
cp  $orig_file_path $deploy_file_path
# 处理文件
processFile $deploy_file_path
fi
echo "||require: [$current_file_path] require [ $orig_file_path ] done！"
done
fi
echo "||require: [$1] all require finished！"
}

# 处理文件
processFile(){
    local file_a=$1
    # 判断是不是文件
    if [ -f $file_a ]; then
        if [ $LPackageType  -eq 3 ]; then
            # 如果是release就处理注释
            deleteComment $file_a
        fi
#        deleteEnding3 $file_a
#        replaceEnding2 $file_a
        deleteRequireMomoKit $file_a
        if [[ "${AutomaticDependence}" =~ "y" ]]; then
            # 如果是release就处理注释
            doRequire $file_a
        fi
        echo "||Process: 【${file_a}】 completed."
    else
        echo "||Warning: 【${file_a}】 was not found!. __Function:processFile()__"
    fi
}

# 处理文件夹
processDirectory(){
if [ -d $1 ]; then # 文件夹
# 遍历文件夹
for file_a in $1/*; do
# 判断是不是文件夹
if [ -d $file_a ]; then
processDirectory $file_a
# 判断是不是文件
elif [ -f $file_a ]; then
processFile $file_a
else
echo "||Warning: 【${file_a}】 unknown!. __Function:processDirectory()__"
fi
done
fi
}

# 处理文件
echo "||Process: Process starting..."
processDirectory $Deploy_Dir

case $LPackageType in
2)
echo "当前包类型为：inhouse"
;;
3)
echo "当前包类型为：distribution"
;;
*)
echo "当前包类型为：debug"
;;
esac

# 如果是release就执行编译
if [ $LPackageType  -eq 3 ]; then
    # 预编译文件夹是否存在
    if [ -d $Precompile_Dir ]; then
        rm -rf $Precompile_Dir
        echo "clear ${Precompile_Dir},..."
    fi
    echo "Create release directory Successfully!"
    mkdir $Precompile_Dir
    cd $Shell_Dir
    # 编译
    ./compile.sh $Precompile_Dir $Deploy_Dir
fi

cd $Deploy_Dir
echo "cd ${Deploy_Dir}"

# 打包
echo "||Archive: Archive starting..."
zip -q -r ${zipFileName} *
echo "||Deploy: Deploy starting..."
filPath="${Deploy_Dir}/${zipFileName}"
echo $filPath
sitesDir="${HOME}/Sites"
echo $UPWD | sudo -S mv $filPath $sitesDir
echo "Successful deployment！"

# 重启服务
echo $UPWD | sudo -S apachectl restart

# 配置Debug
source ~/.bash_profile
mobdebug $Project_Dir $Sub_Path/