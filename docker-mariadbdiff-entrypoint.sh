#!/bin/sh

# start MySQL
/docker-entrypoint.sh mysqld > /dev/null 2>&1 &

SOURCE_DIR=$(dirname "$1")
TARGET_DIR=$(dirname "$2")
SOURCE_FILE=$(basename "$1")
TARGET_FILE=$(basename "$2")

# Wait for MySQL to start
sleep 20

# Create Databases
mysql -proot -e "DROP DATABASE IF EXISTS source; CREATE DATABASE source;"
mysql -proot -e "DROP DATABASE IF EXISTS target; CREATE DATABASE target;"

mysql -proot source < /source_schema/$SOURCE_FILE
mysql -proot target < /target_schema/$TARGET_FILE


/usr/local/bin/dbdiff --server1=root:root@localhost server1.source:server1.target --output=/tmp/diff.sql > /dev/null 2>&1

if [ -f /tmp/diff.sql ]; then
    cat /tmp/diff.sql
    exit 1;
fi
exit 0;
