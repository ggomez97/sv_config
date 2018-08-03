#!/bin/bash
    clear                                   #Este comando limpia la pantalla
hostnamectl set-hostname servidor.its       #Cambia el nombre del servidor

cd /etc/sysconfig/network-scripts           #Se mueve entre directorios

sudo echo 'IPADDR="192.168.10.141"' >> ifcfg-enp0s3 
sudo echo 'PREFIX="24"' >> ifcfg-enp0s3
sudo echo 'GATEWAY="192.168.10.1"' >> ifcfg-enp0s3
sudo echo 'IPV6_PRIVACY="no"' >> ifcfg-enp0s3
sudo echo 'ZONE="public"' >> ifcfg-enp0s3
sudo sed -E -i 's/(BOOTPROTO=)([a-zA-Z]*)/\1none/g' ifcfg-enp0s3
#Todos estos comandos agregan o cambian valores en el archivo ifcfg-enp0s3

systemctl stop NetworkManager #Detiene el servicio NetworkManager
systemctl disable NetworkManager #Deshabilita el servicio NetworkManager
systemctl restart network.service #Reinicia el servicio NetworkManager

hostnamectl  #Nos muestra que de verdad se hallan realizado los cambios


read -n1

sudo groupadd informix                                    # Crear un grupo llamado informix
sudo useradd -g informix -d /home/informix informix            # Crear usuario informix y lo agrega al grupo informix
sudo passwd informix                                      # Asigna una contraseña del usuario informix



#groupadd invitado

#groupadd docente

#groupadd gestion 

#groupadd administrador 


