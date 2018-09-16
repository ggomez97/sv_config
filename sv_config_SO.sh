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

cat login_defs.txt > /etc/login.defs

sudo echo '30 00 * * * root bash /home/gservidor/HMG_scripts/backup.sh' >> /etc/crontab
sudo echo '00 02 * * * root bash /home/gservidor/HMG_scripts/old_bk.sh' >> /etc/crontab
sudo echo '59 00,13 * * 2,3,4,5,6,7 informix ontape -s -L 1 &' >> /etc/crontab
sudo echo '00 00 * * 1 informix ontape-s -L 0 &' >> /etc/crontab
sudo echo '00 00,12 * * * root clamscan --infected --recursive /' >> /etc/crontab
read -n1

sudo groupadd informix                                    # Crear un grupo llamado informix
sudo useradd -g informix -d /opt/informix informix            # Crear usuario informix y lo agrega al grupo informix
sudo passwd informix                                      # Asigna una contraseña del usuario informix


sudo usseradd -g /dev/null usuario.invitados
usermod -s /bin/false usuario.invitados

sudo groupadd docente
sudo useradd -g docente -d /dev/null gabriel.gomez
sudo passwd gabriel.gomez 
usermod -s /bin/false gabriel.gomez
 
sudo groupadd gestion 
sudo useradd -g gestion -m pepe.churro
usermod -s /bin/false pepe.churro

sudo groupadd administrador 
sudo usseradd -g wheel -m admin.server
sudo passwd admin.server 
sudo usermod -aG administrador admin.server
sudo chown -R admin.server /home/admin.server
sudo chmod 770 /home/admin.server 
