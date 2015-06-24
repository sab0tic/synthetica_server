#!/bin/sh

cd "$(dirname "$0")"


# makes things easier if script needs debugging
if [ x$FTB_VERBOSE = xyes ]; then
    set -x
fi

# run install script if MC server or launchwrapper s missing
if [ ! -f minecraft_server.1.7.10.jar ]; then
    echo "Missing required jars. Running install script!"
    sh ./FTBInstall.sh
fi

echo "Starting server"
/usr/java/jdk1.8.0_45/bin/java -server -Xms1024m -Xmx2048m -XX:PermSize=256m -XX:+UseParNewGC -XX:+UseConcMarkSweepGC -jar FTBServer-1.7.10-1352.jar nogui
echo "Server process finished"
