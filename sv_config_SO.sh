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
mkdir /opt/informix                                  # Crear el directorio de informix
chown informix.informix /opt/informix                # Le damos la propiedad a informix 
cat config_informix.txt > /etc/profile.d/informix.sh 

mv informix_comprimido.tar /opt/informix
cd /opt/informix
su informix -c "tar -xvf informix_comprimido.tar"
./ids_install
touch /opt/informix/etc/sqlhosts
chown informix.informix /opt/informix/etc/sqlhosts
cat sqlhosts.txt > /opt/informix/etc/sqlhosts


