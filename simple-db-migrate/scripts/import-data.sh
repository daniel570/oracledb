#!/bin/bash

/u01/app/oracle/product/12.2.0/dbhome_1/bin/sqlplus -s SYSTEM/Oradoc_db1 << SQL
@/home/oracle/sql.sql
exit;
SQL
