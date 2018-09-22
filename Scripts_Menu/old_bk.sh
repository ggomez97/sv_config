#!/bin/bash
clear
    FECHA=`date +%Y-%m-%d -d "-14 days"`
read -n1
    cd /home/gservidor/log_bk

if [ -e /home/gservidor/log_bk/backup$FECHA.tar];then

echo "Borrando el archivo que se encuentra en /home/gservidor/log_bk/backup$FECHA.tar"
	read -n1
	sudo rm -rf /home/gservidor/log_bk/backup$FECHA.tar
fi