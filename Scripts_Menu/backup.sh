#!/bin/bash
 clear

 fecha=`date +%Y-%m-%d`
  echo $fecha
 usuario=`whoami`
if [ ! -d /home/gservidor/log_bk  ]; then 
	mkdir /home/gservidor/log_bk 
fi

read -n1

rm -rf /home/gservidor/log_bk-/backup$fecha
echo "Se esta haciendo el nuevo backup para el dia $fecha"
sudo mkdir /home/gservidor/log_bk/backup$fecha
sudo mkdir /home/gservidor/log_bk/backup$fecha/db /home/gservidor/log_bk/backup$fecha/sistema

#dbexport gestion_utu -o /home/gservidor/log_bk/backup$fecha/db -ss 

sudo cp /etc/passwd /home/gservidor/backup$fecha/sistema

sudo cp /etc/sysconfig/network-scripts/ifcfg-enp0s3 /home/gservidor/log_bk/backup$fecha/sistema

sudo cp /etc/services /home/gservidor/log_bk/backup$fecha/sistema

sudo cp /var/log/secure /home/gservidor/log_bk/backup$fecha/sistema

sudo cp /var/log/messages /home/gservidor/log_bk/backup$fecha/sistema

#sudo cp /opt/informix/backup /home/gservidor/log_bk/backup$fecha/sistema

cd /home/gservidor/log_bk

tar -cvjf backup$fecha.tar backup$fecha
 echo "Se realizo el backup"

 read -n1


