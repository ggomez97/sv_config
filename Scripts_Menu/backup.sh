#!/bin/bash
 clear

 fecha=`date +%Y-%m-%d`
  echo $fecha
 usuario=`whoami`
if [ ! -d /home/$usuario/log_bk  ]; then 
	mkdir /home/$usuario/log_bk 
fi

 read -n1

rm -rf /home/ggomez/log_bk-/backup$fecha
echo "Se esta haciendo el nuevo backup para el dia $fecha"
mkdir /home/ggomez/log_bk/backup$fecha
mkdir /home/$usuario/log_bk/backup$fecha/db /home/$usuario/log_bk/backup$fecha/sistema

dbexport proyecto_x -o /home/$usuario/log_bk/backup$fecha/db -ss 

cp /etc/passwd /home/$usuario/backup$fecha/sistema

cp /etc/sysconfig/network-scripts/ifcfg-enp0s3 /home/$usuario/log_bk/backup$fecha/sistema

cp /etc/services /home/$usuario/log_bk/backup$fecha/sistema

cp /var/log/secure /home/$usuario/log_bk/backup$fecha/sistema

cp /var/log/messages /home/$usuario/log_bk/backup$fecha/sistema

cd /home/$usuario/log_bk

tar -cvjf backup$fecha.tar backup$fecha
 echo "Se realizo el backup"

 read -n1
cd $HOME

