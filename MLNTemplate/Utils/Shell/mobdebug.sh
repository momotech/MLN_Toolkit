#!/usr/bin/env bash

PROJECT_DIR=$1
PROJECT_NAME=${PROJECT_DIR##*/}
TestRootDir=$2

template="<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<module type=\"JAVA_MODULE\" version=\"4\">
  <component name=\"NewModuleRootManager\" inherit-compiler-output=\"true\">
    <exclude-output />
    <content url=\"file://\$MODULE_DIR$\">
      <sourceFolder url=\"file://\$MODULE_DIR\$/src/${TestRootDir}\" isTestSource=\"true\" />
    </content>
    <orderEntry type=\"inheritedJdk\" />
    <orderEntry type=\"sourceFolder\" forTests=\"false\" />
  </component>
</module>"


function main {
    local CONFIG=${PROJECT_DIR}/.idea/${PROJECT_NAME}.iml
    if [  -f ${CONFIG} ]; then
        rm ${CONFIG}
    fi

    touch ${CONFIG}
    echo ${template} | tee ${CONFIG}
}

main


