#! /bin/bash 
###########################################
#
###########################################

# constants
baseDir=$(cd `dirname "$0"`;pwd)
imagename=chatopera/cmake
imageversion=3.14.3
imageid=$imagename:$imageversion

# functions

# main 
[ -z "${BASH_SOURCE[0]}" -o "${BASH_SOURCE[0]}" = "$0" ] || return
cd $baseDir/..
set -x
docker run --rm \
    -d \
    -v $PWD/admin:/admin \
    -v $PWD/app:/app \
    --name cmake \
    $imageid \
    tail -f /dev/null
docker exec -it cmake bash
