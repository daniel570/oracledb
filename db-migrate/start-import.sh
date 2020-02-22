#!/bin/bash

/bin/bash /home/oracle/setup/dockerInit.sh &

sleep 100

./check-db.sh

kill %1
wait
