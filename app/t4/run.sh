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

# 生成时，指定安装路径 CMAKE_INSTALL_PREFIX
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR .. 

# 设置VERBOSE查看信息
make VERBOSE=1
set -x

# Mac 设置动态库路径
DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:$INSTALL_DIR/lib

# Linux 设置动态库路径
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$INSTALL_DIR/lib

# 安装
make install

# 执行
cd $INSTALL_DIR/
## 查看一个可执行程序依赖的共享库
## Mac 中使用otool
otool -L bin/hello-t4
# ldd bin/hello-t4 # linux 使用ldd
bin/hello-t4
