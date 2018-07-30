#!/bin/bash
    clear
hostnamectl set-hostname servidor.its 

cat network_config.txt > /etc/sysconfig/network-scripts/ifcfg-enp0s3

systemctl stop NetworkManager
systemctl disable NetworkManager
systemctl restart network.service

cat /etc/sysconfig/network-scripts/ifcfg-enp0s3 

hostnamectl 

read -n1

groupadd informix                                    # Crear un grupo llamado informix
useradd -g informix -d /dev/null informix            # Crear usuario informix y lo agrega al grupo informix
passwd informix                                      # Asigna una contraseña del usuario informix


read -n1

