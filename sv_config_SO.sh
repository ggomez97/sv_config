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
cat onconfig.txt > /opt/informix/etc/onconfig.std # Cambia LTAPEDEV /dev/null , ROOTPATH /opt/informix/logdir/rootdbs
                                                    # DBSERVERNAME miServidor

su informix -c "mkdir /opt/informix/logdir"               # Crea el directorio /opt/informix/logdir	
chown informix.informix /opt/informix/logdir         # Crea el directorio /opt/informix/logdir	
informix -c "chmod 770 /opt/informix/logdir"           # Modificamos los permisos
su informix -c "touch /opt/informix/logdir/rootdbs"       # Creamos el archivo rootdbs 
su informix -c "chmod 660 /opt/informix/logdir/rootdbs"   # Modificamos los permisos al dbspace root
sudo chown informix.informix /opt/informix/logdir/rootdbs # Modificamos el propietario al dbspace root

cat services.txt > /etc/service 
