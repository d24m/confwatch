#!/bin/bash
#changing directory
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
SKRIPT_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
cd $SKRIPT_DIR
if [ -f msg.log ]
then
	rm msg.log
fi
#remove leading slash
source cw.conf
DIR=`echo "$DIR" | sed -e 's#/$##'`


#check if this directory exists
if [ ! -d "$DIR" ];
then
	echo "Directory $DIR not exists"
	exit 1
fi
#watch this directory
iwatch -r -c "./cw_filter %f" $DIR > /dev/null 2>&1 
