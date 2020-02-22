#!/bin/bash

bool=true

while $bool; do

if [ -f /bin/sqlplus64 ]; then echo "sqlplus is found";

#if [ $PATH == "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/u01/app/oracle/product/12.2.0/dbhome_1/bin" ]; then echo "Path is updated"; else echo "Path not updated yet..."; sleep 10; continue;  fi

echo $(exit | sqlplus -S SYSTEM/Oradoc_db1@10.12.8.231:1521/ORCLCDBXDB.localdomain) > error.log
isup=$(cat error.log | grep ERROR | wc -l)
if [ $isup -eq 0 ]; then
echo "db is up"

./import-data.sh

bool=false
else
echo "db is not up yet..."
sleep 10
fi

else
echo "no sqlplus found yet... Please wait 10s"
sleep 10
fi

done
