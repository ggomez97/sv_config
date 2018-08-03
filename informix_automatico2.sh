#!/bin/bash
    clear

touch /opt/informix/etc/sqlhosts
chown informix.informix /opt/informix/etc/sqlhosts
su informix -c "cat sqlhosts.txt > /opt/informix/etc/sqlhosts"
su informix -c "cat onconfig.txt > /opt/informix/etc/onconfig.std" # Cambia LTAPEDEV /dev/null , ROOTPATH /opt/informix/logdir/rootdbs
                                                    # DBSERVERNAME miServidor

su informix -c "mkdir /opt/informix/logdir"               # Crea el directorio /opt/informix/logdir	
chown informix.informix /opt/informix/logdir         # Crea el directorio /opt/informix/logdir	
su informix -c "chmod 770 /opt/informix/logdir"           # Modificamos los permisos
su informix -c "touch /opt/informix/logdir/rootdbs"       # Creamos el archivo rootdbs 
su informix -c "chmod 660 /opt/informix/logdir/rootdbs"   # Modificamos los permisos al dbspace root
chown informix.informix /opt/informix/logdir/rootdbs # Modificamos el propietario al dbspace root

cat services.txt > /etc/service 

read -n1

firewall-cmd --zone=public --permanent --add-port=50000/tcp
firewall-cmd --reload

read -n1

mkdir /mis_dbspaces
chown informix.informix /mis_dbspaces # Modificamos los permisos

su -
source /etc/profile.d/informix.sh
oninit -ivy 
onstat -

read -n1

cd /mis_dbspaces
touch ITS_dbspace.dbspace
chown informix.informix ITS_dbspace.dbspace # Modificamos los permisos
chmod 660 ITS_dbspace.dbspace

onspaces -c -d ITS_dbspace -p /mis_dbspaces/ITS_dbspace.dbspace -o 0 -s 1000000 

exit