#!/bin/bash
    clear
hostnamectl set-hostname servidor.its 

cd /etc/sysconfig/network-scripts

echo 'IPADDR="192.168.10.141"' >> ifcfg-enp0s3
echo 'PREFIX="24"' >> ifcfg-enp0s3
echo 'GATEWAY="192.168.10.1"' >> ifcfg-enp0s3
echo 'IPV6_PRIVACY="no"' >> ifcfg-enp0s3
echo 'ZONE="public"' >> ifcfg-enp0s3
sed -E -i 's/(BOOTPROTO=)([a-zA-Z]*)/\1none/g' ifcfg-enp0s3

systemctl stop NetworkManager
systemctl disable NetworkManager
systemctl restart network.service

hostnamectl 


read -n1

groupadd informix                                    # Crear un grupo llamado informix
useradd -g informix -d /home/informix informix            # Crear usuario informix y lo agrega al grupo informix
passwd informix                                      # Asigna una contraseña del usuario informix



#groupadd invitado

#groupadd docente

#groupadd gestion

#groupadd administrador


