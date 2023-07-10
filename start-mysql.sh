#!/usr/bin/env bash

set -eu

echo "Starting mysql server"
/usr/bin/mysqld_safe &

while true; do
    sleep 1

    exit_code=0
    mysql -e ";" 2> /dev/null || exit_code=$?
    if [ "${exit_code}" -eq "0" ]; then
        echo "Started mysql server"
        exit
    fi
done
