#!/bin/bash

sqlplus -s SYSTEM/Oradoc_db1@10.12.9.222:1521/ORCLCDB.localdomain << SQL
@sql.sql
exit;
SQL

