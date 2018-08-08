#!/bin/bash
 clear

 fecha='date +%Y-%m-%d'
  echo $fecha
if [ ! -d /home/gservidor/log_bk  ]; then 
	mkdir /home/gservidor/log_bk 
fi

 read -n1

rm -rf /home/gservidor/log_bk-/backup$fecha
echo "Se esta haciendo el nuevo vackup para el dia $fecha"
mkdir /home/gservidor/log_bk/backup$fecha
mkdir /home/gservidor/log_bk/backup$fecha/db /home/gservidor/log_bk/backup$fecha/sistema
dbexport proyecto_x -o /home/gservidor/log_bk/backup$fecha/db -ss 
cp /etc/passwd /home/gservidor/backup$fecha/sistema
cp /etc/sysconfig/network-scripts/ifcfg-enp0s3 /home/gservidor/log_bk/backup$fecha/sistema
cp /etc/services /home/gservidor/log_bk/backup$fecha/sistema

 echo "Se realizo el backup"
 read -n1


