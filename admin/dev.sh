#! /bin/bash 
###########################################
#
###########################################

# constants
baseDir=$(cd `dirname "$0"`;pwd)
# functions

# main 
[ -z "${BASH_SOURCE[0]}" -o "${BASH_SOURCE[0]}" = "$0" ] || return
cd $baseDir/..
set -x
docker run --rm \
    -it \
    -v $PWD/admin:/admin \
    -v $PWD/linux:/app \
    --name cmake \
    chatopera/cmake:3.13.3 \
    bash
