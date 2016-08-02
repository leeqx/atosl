#!/bin/bash - 
#===============================================================================
#
#          FILE: build.sh
# 
#         USAGE: ./build.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 08/02/2016 15:00
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

export CFLAGS="-I${PWD}/libelf-0.8.9/lib -DHAVE_LIBELF_H"
export LD_LIBRARY_PTH=-L${PWD}/libelf-0.8.9/lib/
export 

cd ./libelf-0.8.9/
make clean
./configure 
if [ $? -eq 0 ];then
    make 
    if [ $? -eq 0 ];then
        echo -e "\033[0;33m build libelf ok \033[0m"
    else
        echo -e "\033[0;31m build libelf failed \033[0m"
    fi
else
    echo -e "\033[0;31m configure for libelf failed \033[0m"
    exit
fi
cd -

cd ./dwarf-20160613/
make clean
./configure
if [ $? -eq 0 ];then
    make
    if [ $? -eq 0 ];then
        echo -e "\033[0;33m build dwarf ok \033[0m"
    else
        echo -e "\033[0;31m build dwarf failed \033[0m"
    fi
else
    echo -e "\033[0;31m build dwarf failed \033[0m"
    exit
fi

cd -
make clean
make
if [ $? -eq 0 ];then
    echo -e "\033[0;33m build atosl ok \033[0m"
else
    echo -e "\033[0;31m build atosl failed \033[0m"
fi


