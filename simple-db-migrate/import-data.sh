#!/bin/bash

sqlplus -s SYSTEM/Oradoc_db1@146.148.49.240:1521/ORCLCDBXDB.localdomain << SQL
@sql.sql
exit;
SQL
