#!/bin/bash
    clear 

mkdir /opt/informix                                  # Crear el directorio de informix
chown informix.informix /opt/informix                # Le damos la propiedad a informix 
sudo cat config_informix.txt > /etc/profile.d/informix.sh 

cat /etc/profile.d/informix.sh 
sudo mv informix_comprimido.tar /opt/informix
cd /opt/informix
su informix -c "tar -xvf informix_comprimido.tar"
sudo ./ids_install

