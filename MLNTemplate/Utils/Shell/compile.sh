#!/bin/bash
# Author tamer

PRE_DST_Dir=$1
DST_Dir=$2


# 备份
echo "||Backup: backup starting..."
for file_a in ${DST_Dir}/*; do
    cp -R $file_a $PRE_DST_Dir
    echo "||Backup: 【${file_a}]】 completed."
done

complie(){
    luac -o $1  $2
}

doFile(){
    if [ -d $1 ]; then # 文件夹
        # 遍历文件夹
        for file_a in $1/*; do
            # 判断是不是文件夹
            if [ -d $file_a ]; then
                doFile $file_a
                # 判断是不是文件
            elif [ -f $file_a ]; then
                echo "||Compile: ${file_a} "
                complie $file_a $file_a
            else
                echo "||Warning: 【${file_a}】 unknown!. __Function:processDirectory()__"
            fi
        done
    fi
}

doFile $DST_Dir

echo "||Compile: all completed! "