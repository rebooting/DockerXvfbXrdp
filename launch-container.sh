#!/bin/bash
VOLUME=""
if [ ! -z $1 ];then
    echo "setting cvol"
    VOLUME="-v $1:/buildhome"
else
    echo "defaulting to codevol"
    VOLUME="-v codevol:/buildhome"
fi
 docker run -p 7800:7800  $VOLUME -p 10389:3389 --rm sid-xrdp