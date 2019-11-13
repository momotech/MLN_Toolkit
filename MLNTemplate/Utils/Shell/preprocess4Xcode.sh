#!/bin/bash
# Author tamer

Files_Dir=${SRCROOT}/Subtree/MMILuaExtra/MMILua
echo $Files_Dir
# 处理文件
processFile(){
local file_a=$1
# 判断是不是文件
if [ -f $file_a ]; then
# method
sed -i "" 's/\(^ *LUA_EXPORT_STATIC_METHOD([^@]*\)@selector(\([^)]*\)) *\([^)]*) *\)$/\1"\2"\3/g' $file_a
sed -i "" 's/\(^ *LUA_EXPORT_METHOD([^@]*\)@selector(\([^)]*\)) *\([^)]*) *\)$/\1"\2"\3/g' $file_a
sed -i "" 's/\(^ *LUA_EXPORT_VIEW_METHOD([^@]*\)@selector(\([^)]*\)) *\([^)]*) *\)$/\1"\2"\3/g' $file_a
# Property
sed -i "" 's/\(^ *LUA_EXPORT_PROPERTY([^@]*\)@selector(\([^)]*\)) *, *@selector(\([^)]*\)) *,\([^)]*) *\)$/\1"\2""\3"\4/g' $file_a
sed -i "" 's/\(^ *LUA_EXPORT_VIEW_PROPERTY([^@]*\)@selector(\([^)]*\)) *, *@selector(\([^)]*\)) *,\([^)]*) *\)$/\1"\2""\3"\4/g' $file_a
echo "||Process: 【${file_a}】 completed."
else
echo "||Warning: 【${file_a}】 was not found!. __Function:processFile()__"
fi
}

processDirectory(){
if [ -d $1 ]; then # 文件夹
for file_a in $1/*; do
# 判断是不是文件夹
if [ -d $file_a ]; then
processDirectory $file_a
# 判断是不是文件
elif [ -f $file_a ]; then
case "$file_a" in
*.m)
processFile $file_a;;
esac
else
echo "||Warning: 【${file_a}】 unknown!. __Function:processDirectory()__"
fi
done
fi
}
processDirectory $Files_Dir

