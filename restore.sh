#!/bin/bash
# MySQL Restore Script
RED='\033[01;31m'
GREEN='\033[01;32m'
RESET='\033[0m'
echo -e "$RED DATABASE RESTORATION BEGIN PLEASE WAIT ....$RESET"
echo -e " "
echo -e " "
for db in `cat /tmp/dblist`; 
do sleep 0; 
echo -e "$RED Restoring DB $db ....$RESET" ; 
mysql $db < /home/mysqlbackup/$db.sql;
if [ $? -eq 0 ]; 
then echo -e "$GREEN $db Restored ! $RESET"
else
echo -e "Unable to restore $RED $db $RESET press $RED[ENTER]$RESET to continue";
read; 
fi; 
done
