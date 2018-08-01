#!/bin/bash
    clear
hostnamectl set-hostname servidor.its 

cd /etc/sysconfig/network-scripts
sed -E 's(BOOTPROTO=")([a-zA-Z*])(")/\1none3/g' ifcfg-enp0s3
echo 'IPADDR="192.168.10.141"' >> ifcfg-enp0s3
echo 'PREFIX="24"' >> ifcfg-enp0s3
echo 'GATEWAY="192.168.10.1"' >> ifcfg-enp0s3
echo 'IPV6_PRIVACY="no"' >> ifcfg-enp0s3
echo 'ZONE=public"' >> ifcfg-enp0s3

systemctl stop NetworkManager
systemctl disable NetworkManager
systemctl restart network.service

cat /etc/sysconfig/network-scripts/ifcfg-enp0s3 

hostnamectl 

read -n1

sudo groupadd informix                                    # Crear un grupo llamado informix
sudo useradd -g informix -d /home/informix informix            # Crear usuario informix y lo agrega al grupo informix
sudo passwd informix                                      # Asigna una contraseña del usuario informix


read -n1

