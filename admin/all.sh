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

# rm files
for x in `find . -name "build"`; do rm -rf $x; done
rm -rf tmp && mkdir tmp

cd $baseDir/../app
for x in `ls`; do
    echo "----------------"
    echo "- Processing" $x
    cd $baseDir/../app/$x
    ./run.sh
    echo "- done. "
    echo "----------------"
    sleep 3
done