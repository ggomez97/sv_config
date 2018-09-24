#!/bin/bash
 clear

 fecha=`date +%Y-%m-%d`
  echo $fecha
 usuario=`whoami`
if [ ! -d /home/$usuario/log_bk  ]; then 
	sudo mkdir /home/$usuario/log_bk 
fi 

read -n1

sudo rm -rf /home/$usuario/log_bk-/backup$fecha
echo "Se esta haciendo el nuevo backup para el dia $fecha"
sudo mkdir /home/$usuario/log_bk/backup$fecha
sudo mkdir /home/$usuario/log_bk/backup$fecha/db /home/$usuario/log_bk/backup$fecha/sistema

dbexport gestion_utu -o /home/$usuario/log_bk/backup$fecha/db -ss 

sudo cp /etc/passwd /home/$usuario/backup$fecha/sistema

sudo cp /etc/sysconfig/network-scripts/ifcfg-enp0s3 /home/$usuario/log_bk/backup$fecha/sistema

sudo cp /etc/services /home/$usuario/log_bk/backup$fecha/sistema

sudo cp /var/log/secure /home/$usuario/log_bk/backup$fecha/sistema

sudo cp /var/log/messages /home/$usuario/log_bk/backup$fecha/sistema

sudo cp /opt/informix/backup /home/$usuario/log_bk/backup$fecha/sistema

cd /home/$usuario/log_bk

sudo tar -cvjf backup$fecha.tar backup$fecha


 echo "Se realizo el backup"

 read -n1


