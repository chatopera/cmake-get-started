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

# 设置动态库路径
case "$(uname -s)" in
   Darwin)
     echo 'Mac OS X'
     # Mac 设置动态库路径
     export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:$INSTALL_DIR/lib
     ;;

   Linux)
     echo 'Linux'
     # Linux 设置动态库路径
     export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$INSTALL_DIR/lib
     ;;

   CYGWIN*|MINGW32*|MSYS*)
     echo 'MS Windows'
     echo 'Not supported.'
     exit 1
     ;;

   *)
     echo 'other OS' 
     echo 'Not supported.'
     exit 1
     ;;
esac

set -x
src/curltest