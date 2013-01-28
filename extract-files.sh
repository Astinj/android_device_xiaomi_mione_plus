#!/bin/sh

VENDOR=xiaomi
DEVICE=mione_plus

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary
rm -rf $BASE/*

if [ -z "$2" ]; then
    ZIPFILE=../../../${DEVICE}_update.zip
else
    ZIPFILE=$2
fi

if [ "$1" = "unzip" -a ! -e $ZIPFILE ]; then
    echo $ZIPFILE does not exist.
else
    for FILE in `cat proprietary-files.txt | grep -v ^# | grep -v ^$`; do
        DIR=`dirname $FILE`
	if [ ! -d $BASE/$DIR ]; then
            mkdir -p $BASE/$DIR
	fi
	if [ "$1" = "unzip" ]; then
            unzip -j -o $ZIPFILE system/$FILE -d $BASE/$DIR
	else
            adb pull /system/$FILE $BASE/$FILE
	fi
    done
fi
./setup-makefiles.sh
