#! /bin/bash 
###########################################
#
###########################################

# constants
baseDir=$(cd `dirname "$0"`;pwd)
INSTALL_DIR=$baseDir/../../tmp
BUILD_TYPE=Debug # [Debug|Release|RelWithDebInfo|MinSizeRel]
BUILD_DIR=build-$BUILD_TYPE
# functions

# main 
[ -z "${BASH_SOURCE[0]}" -o "${BASH_SOURCE[0]}" = "$0" ] || return
cd $baseDir/
if [ -d $BUILD_DIR ]; then
    rm -rf $BUILD_DIR
fi
mkdir $BUILD_DIR && cd $BUILD_DIR
cmake -G "Unix Makefiles" \
    -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR \
    -DCMAKE_BUILD_TYPE=$BUILD_TYPE \
    .. 
make
./bin/hello-t2

make install
