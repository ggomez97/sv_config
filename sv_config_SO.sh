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

sudo echo '30 00 * * * sh /home/gservidor/scripts/backup.sh' >> /etc/crontab
sudo echo '00 02 * * * sh /home/gservidor/scripts/old_bk.sh' >> /etc/crontab
sudo echo '59 00,13 * * 2,3,4,5,6,7 informix ontape -s -L 1&' >> /etc/crontab
sudo echo '00 00 * * 1 informix ontape-s -L 0 &' >> /etc/crontab
sudo echo '00 00,12 * * * root clamscan --infected --recursive /' >> /etc/crontab


read -n1

sudo groupadd informix                                    # Crear un grupo llamado informix
sudo useradd -g informix -d /opt/informix informix            # Crear usuario informix y lo agrega al grupo informix
sudo passwd informix                                      # Asigna una contraseña del usuario informix


sudo group add invitados
sudo usseradd -g invitados /dev/null usuario.invitados
sudo passwd #La contraseña sera 1234

sudo groupadd docente
sudo useradd -g docente -d /dev/null gabriel.gomez
sudo passwd gabriel.gomez 
sudo useradd -g docente -d /dev/null ricardo.perez
sudo passwd ricardo.perez
sudo useradd -g docente -d /dev/null franco.delgado
sudo passwd franco.delgado
sudo useradd -g docente -d /dev/null fernando.mendaro
sudo passwd fernando.mendaro
sudo useradd -g docente -d /dev/null agusto.favaro
sudo passwd agusto.favaro
sudo useradd -g docente -d /dev/null valentin.perez
sudo passwd valentin.perez
sudo useradd -g docente -d /dev/null lem.fontes
sudo passwd lem.fontes
sudo useradd -g docente -d /dev/null joaquin.nuniez
sudo passwd joaquin.nuniez
sudo useradd -g docente -d /dev/null victoria.butzke
sudo passwd victoria.butzke
sudo useradd -g docente -d /dev/null agustin.zibechi
sudo passwd agustin.zibechi
sudo useradd -g docente -d /dev/null camilo.castaguena
sudo passwd camilo.castaguena
sudo useradd -g docente -d /dev/null camilo.maqueira
sudo passwd camilo.maqueira
sudo useradd -g docente -d /dev/null diego.pazos
sudo passwd diego.pazos
sudo useradd -g docente -d /dev/null gissel.arregui
sudo passwd gissel.arregui
sudo useradd -g docente -d /dev/null joaquin.pintos
sudo passwd joaquin.pintos
sudo useradd -g docente -d /dev/null gabriel.duran
sudo passwd gabriel.duran
sudo useradd -g docente -d /dev/null daniel.cherro
sudo passwd daniel.cherro
sudo useradd -g docente -d /dev/null cecilia.galllo
sudo passwd cecilia.galllo
sudo useradd -g docente -d /dev/null christian.baptista
sudo passwd christian.baptista
sudo useradd -g docente -d /dev/null eloisa.benech
sudo passwd eloisa.benech
sudo useradd -g docente -d /dev/null ivan.marenco
sudo passwd ivan.marenco


sudo groupadd gestion 


sudo groupadd administrador 
sudo usseradd -g administrador -d /home/admin.server adminserver
sudo passwd adminserver 
sudo usermod -aG wheel adminserver
sudo chown -R adminserver /home/admin.server
sudo chmod 770 /home/admin.server 
