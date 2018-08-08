#!/bin/bash
clear

oninit -ivy 
onstat -

read -n1

cd /mis_dbspaces
touch ITS_dbspace.dbspace
chown informix.informix ITS_dbspace.dbspace 
chmod 660 ITS_dbspace.dbspace

onspaces -c -d ITS_dbspace -p /mis_dbspaces/ITS_dbspace.dbspace -o 0 -s 1000000 

if [ ! -d /opt/informix/backup ]; then 
 su informix -c "mkdir /opt/informix/backup"
fi
chmod 770 /opt/informix/backup
