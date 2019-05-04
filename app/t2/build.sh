#! /bin/bash 
###########################################
#
###########################################

# constants
baseDir=$(cd `dirname "$0"`;pwd)
# functions

# main 
[ -z "${BASH_SOURCE[0]}" -o "${BASH_SOURCE[0]}" = "$0" ] || return
cd $baseDir/
if [ -d build ]; then
    rm -rf build
fi
mkdir build && cd build
cmake -G "Unix Makefiles" ..
make
./bin/hello
