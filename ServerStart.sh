#!/bin/sh

cd "$(dirname "$0")"

# makes things easier if script needs debugging
if [ x$FTB_VERBOSE = xyes ]; then
    set -x
fi

# START FIFO
pipe=/tmp/pipes/beastfeeder-fifo
if [ ! -p $pipe ];then
    mkfifo $pipe
fi

echo "Starting server"
/usr/java/jdk1.8.0_45/bin/java -server -Xms1024m -Xmx2048m -XX:PermSize=256m -XX:+UseParNewGC -XX:+UseConcMarkSweepGC -jar FTBServer-1.7.10-1352.jar nogui
