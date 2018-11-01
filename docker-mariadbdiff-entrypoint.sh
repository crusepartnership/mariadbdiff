#!/bin/sh

# Step 1. Diff Schemas
/usr/local/bin/dbdiff --server1=root:root@mariadb server1.source:server1.target --output=/tmp/diff.sql > /dev/null 2>&1

if [ -f /tmp/diff.sql ]; then
    cat /tmp/diff.sql
    exit 1;
fi
exit 0;
