#!/bin/bash
    clear 

mkdir /opt/informix                                  # Crear el directorio de informix
chown informix.informix /opt/informix                # Le damos la propiedad a informix 
cat config_informix.txt > /etc/profile.d/informix.sh 

read -n1

mv informix_comprimido.tar /opt/informix
cd /opt/informix
su informix -c "tar -xvf informix_comprimido.tar"
./ids_install