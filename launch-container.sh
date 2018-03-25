#!/bin/bash

# SET YOUR PASSWORD HERE
VNCPASS="password"
VOLUME=""
if [ ! -z $1 ];then
    echo "setting cvol"
    VOLUME="-v $1:/root"
else
    echo "defaulting to codevol"
    VOLUME="-v codevol:/root"
fi
 docker run -p 7800:7800  -e VNCPASS=$VNCPASS $VOLUME -p 8888:8888 --rm sid-xrdp