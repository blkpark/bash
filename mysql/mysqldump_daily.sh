#!/bin/sh

PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH

if [ $# -ne 2 ];
then
    echo "Usage: mongodump_daily [hostname] [directory_name]"
else

    NOW=`date +%y%m%d`
    HOST_NAME="$1"
    DUMP_ROOT_DIRECTORY_NAME="$2"

    # find  path
    if [ ! -d "$DUMP_ROOT_DIRECTORY_NAME" ]
    then
         echo "$DUMP_ROOT_DIRECTORY_NAME"
        echo "Not Found Directory"
        exit 1;
    fi

    FULLPATH="$DUMP_ROOT_DIRECTORY_NAME/$NOW"

    mongodump --host $HOST_NAME -o $FULLPATH
fi
