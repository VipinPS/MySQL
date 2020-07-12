#!/bin/bash
# MySQL Backup Script
RED='\033[01;31m'
GREEN='\033[01;32m'
RESET='\033[0m'
DIR=/home/mysqlbackup
echo -e "$RED DATABASE BACKUP BEGIN PLEASE WAIT ....$RESET"
echo -e " "
echo -e " "
if [ ! -d "$DIR" ]; then mkdir -p /home/mysqlbackup ; fi
mysql -A  -sN -e "show databases" > /tmp/dblist
for db in `cat /tmp/dblist`; 
do sleep 0; 
echo -e " $RED Dumping DB $db ........ $RESET" ; 
mysqldump  $db > /home/mysqlbackup/$db.sql; 
if [ $? -eq 0 ]; 
then echo -e "$GREEN Done dumping $db ! $RESET"; 
else
echo -e "Dumping $RED $db $RESET failed HIT $RED[ENTER]$RESET TO CONTINUE" >> /tmp/mysql.log.txt
read; 
fi; 
done
