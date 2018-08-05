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



sudo groupadd docente
sudo useradd -g docente -d /dev/null gabriel.gomez
sudo useradd -g docente -d /dev/null ricardo.perez
sudo useradd -g docente -d /dev/null franco.delgado
sudo useradd -g docente -d /dev/null fernando.mendaro
sudo useradd -g docente -d /dev/null agusto.favaro
sudo useradd -g docente -d /dev/null valentin.perez
sudo useradd -g docente -d /dev/null lem.fontes
sudo useradd -g docente -d /dev/null joaquin.nuniez
sudo useradd -g docente -d /dev/null victoria.butzke
sudo useradd -g docente -d /dev/null agustin.zibechi
sudo useradd -g docente -d /dev/null camilo.castaguena
sudo useradd -g docente -d /dev/null camilo.maqueira
sudo useradd -g docente -d /dev/null diego.pazos
sudo useradd -g docente -d /dev/null gissel.Arregui
sudo useradd -g docente -d /dev/null joaquin.pintos
sudo useradd -g docente -d /dev/null gabriel.duran
sudo useradd -g docente -d /dev/null daniel.cherro
sudo useradd -g docente -d /dev/null cecilia.galllo
sudo useradd -g docente -d /dev/null christian.baptista
sudo useradd -g docente -d /dev/null eloisa.benech
sudo useradd -g docente -d /dev/null ivan.marenco

sudo groupadd gestion 

sudo groupadd administrador 
sudo usseradd -g administrador -d /home/admin.server adminserver
sudo passwd adminserver 
sudo usermod -aG wheel adminserver
sudo chown -R adminserver /home/adminserver
sudo chmod 770 /home/adminserver 
