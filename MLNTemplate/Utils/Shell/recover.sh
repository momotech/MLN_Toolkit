#!/bin/bash
# Author tamer

Folder_Lua="${HOME}/workspace/dev_refact/Classes/MMILua/Lua/MMLua/src"

for file_a in ${Folder_Lua}/*.lua; do
        sed -i "" 's/^ *-- *local *\(.*\)= *require( *"UI.\(.*\) " *) *--$/\1=\2()/g' $file_a
        sed -i "" 's/^ *-- *local *\(.*\)= *require( *"Util.\(.*\) " *) *--$/\1=\2()/g' $file_a
        sed -i "" 's/^ *local *\(.*\)= *require( *"Util.\(.*\) " *) *--$/\1=\2()/g' $file_a
        sed -i "" 's/^ *local *\(.*\)= *require( *"UI.\(.*\)" *) *--$/\1=\2()/g' $file_a
	done
