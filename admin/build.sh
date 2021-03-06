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
docker build \
    --no-cache=true \
    --build-arg VCS_REF=`git rev-parse --short HEAD` \
    --build-arg CMAKE_VERSION=${imageversion} \
    --force-rm=true --tag $imageid .

set -x
docker push $imageid