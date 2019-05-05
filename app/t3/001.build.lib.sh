#! /bin/bash 
###########################################
#
###########################################

# constants
baseDir=$(cd `dirname "$0"`;pwd)
INSTALL_DIR=$baseDir/../../tmp
# functions

# main 
[ -z "${BASH_SOURCE[0]}" -o "${BASH_SOURCE[0]}" = "$0" ] || return
cd $baseDir/
if [ -d build ]; then
    rm -rf build
fi
mkdir build && cd build

## 生成时，指定安装路径 CMAKE_INSTALL_PREFIX
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR .. 
make
set -x
## 查看一个库中到底有哪些函数
nm lib/libhello.dylib

## 安装
make install
