#!/usr/bin/env bash

#@P@ : 子文件夹名称
#@T@ : 类型 debug|release
#@TP@ : 类型 debug:1 release 3
#@S@ : 开机密码
#@SR@ : src目录 /src
#@Z@ : 打包zip的名称
template="<component name=\"ProjectRunConfigurationManager\">
  <configuration default=\"false\" name=\"@Z@@T@\" type=\"BashConfigurationType\" factoryName=\"Bash\">
    <option name=\"INTERPRETER_OPTIONS\" value=\"\" />
    <option name=\"INTERPRETER_PATH\" value=\"/bin/bash\" />
    <option name=\"WORKING_DIRECTORY\" value=\"\" />
    <option name=\"PARENT_ENVS\" value=\"true\" />
    <option name=\"SCRIPT_NAME\" value=\"\$USER_HOME\$/bin/deploy\" />
    <option name=\"PARAMETERS\" value=\"\$PROJECT_DIR\$@SR@ @S@ \$PROJECT_DIR\$ @TP@ @P@ @Z@\" />
    <module name=\"\" />
    <method />
  </configuration>
</component>"

function main {
    template=${template//@S@/${1}}
    if [[ ! -d ./.idea/runConfigurations ]]; then
        mkdir ./.idea/runConfigurations
    fi
    for f in `ls .idea/runConfigurations`; do
        if [[ ${f} == *Debug\.xml || ${f} == *Release\.xml ]]; then
            rm .idea/runConfigurations/${f}
        fi
    done
    sub=$(ls src)
    if [[ ! -n "${sub}" ]]; then
        echo "src目录下没有任何文件！！！！！"
        return 1
    fi
    luaFile=False
    for f in ${sub}; do
        if [[ -f src/${f} && ${f: -4} == ".lua" ]]; then
            f=${f//\.lua/}
            thisf=${template//@SR@/}
            thisf=${thisf//@P@/src}
            thisf=${thisf//@Z@/${f}}
            debugf=${thisf//@T@/Debug}
            debugf=${debugf//@TP@/1}
            echo ${debugf} > ./.idea/runConfigurations/${f}Debug.xml
            releasef=${thisf//@T@/Relase}
            releasef=${releasef//@TP@/3}
            echo ${releasef} > ./.idea/runConfigurations/${f}Release.xml
            luaFile=True
        fi
    done
    if $luaFile; then
        return 0
    fi
    for f in ${sub}; do
        if [[ -d src/${f} ]]; then
            thisf=${template//@SR@/\/src}
            thisf=${thisf//@P@/${f}}
            thisf=${thisf//@Z@/${f}}
            debugf=${thisf//@T@/Debug}
            debugf=${debugf//@TP@/1}
            echo ${debugf} > ./.idea/runConfigurations/${f}Debug.xml
            releasef=${thisf//@T@/Relase}
            releasef=${releasef//@TP@/3}
            echo ${releasef} > ./.idea/runConfigurations/${f}Release.xml
        fi
    done
}

if [ $# = 0 ];
then
    echo "请输入开机密码 _>"
    read PSW
    main ${PSW}
else
    main $1
fi
