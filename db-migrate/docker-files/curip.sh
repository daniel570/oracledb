#!/bin/bash

curIp=$(cat import-data.sh | cut -d "@" -f 2 | cut -d ":" -f 1 | grep 10.*.*.*)
echo "$curIp" > curip.txt
