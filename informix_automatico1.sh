#!/bin/bash
    clear 

sudo mkdir /opt/informix                                  # Crear el directorio de informix
sudo chown informix.informix /opt/informix                # Le damos la propiedad a informix 
sudo cat config_informix.txt > /etc/profile.d/informix.sh 

read -n1

sudo mv informix_comprimido.rar /opt/informix
cd /opt/informix
su informix -c "tar -xvf informix_comprimido.tar"
./ids_install

